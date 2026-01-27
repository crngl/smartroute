const pool = require('../config/database');
 
/**
* SmartRoute AI - Trip Planning Logic
* Developer: Sana Dizmari
* 
* This module handles intelligent trip planning by:
* - Filtering destinations and activities by budget and interests
* - Calculating distances using PostGIS spatial queries
* - Distributing activities across travel days
* - Optimizing routes to minimize travel distance
* - Grouping activities by city (one city per day)
*/
 
class TripPlanner {
  /**
   * Main function to create a trip plan
   * @param {Object} params - Trip parameters
   * @param {number} params.budget - Total budget in TRY
   * @param {number} params.days - Number of travel days
   * @param {Array<string>} params.interests - User interests (e.g., ['nature', 'culture', 'food'])
   * @param {number} params.userId - User ID (optional)
   * @returns {Object} Generated trip itinerary
   */
  async createTripPlan({ budget, days, interests, userId = null }) {
    try {
      // Step 1: Validate inputs
      this.validateInputs(budget, days, interests);
 
      // Step 2: Get activities that match interests and budget
      const activities = await this.getMatchingActivities(interests, budget);
 
      if (activities.length === 0) {
        throw new Error('No activities found matching your preferences and budget');
      }
 
      // Step 3: Calculate budget per day
      const budgetPerDay = budget / days;
 
      // Step 4: Distribute activities across days (ONE CITY PER DAY)
      const itinerary = this.distributeActivitiesAcrossDays(
        activities, 
        days, 
        budgetPerDay
      );
 
      // Step 5: Calculate total cost
      const totalCost = this.calculateTotalCost(itinerary);
 
      // Step 6: Save itinerary to database (if userId provided)
      if (userId) {
        await this.saveItinerary(userId, itinerary, totalCost);
      }
 
      // Step 7: Return formatted result
      return {
        success: true,
        plan: {
          totalDays: days,
          totalBudget: budget,
          totalCost: totalCost,
          remainingBudget: budget - totalCost,
          itinerary: itinerary
        }
      };
 
    } catch (error) {
      console.error('Trip planning error:', error);
      throw error;
    }
  }
 
  /**
   * Validate user inputs
   */
  validateInputs(budget, days, interests) {
    if (!budget || budget <= 0) {
      throw new Error('Budget must be a positive number');
    }
    if (!days || days <= 0 || days > 30) {
      throw new Error('Days must be between 1 and 30');
    }
    if (!Array.isArray(interests) || interests.length === 0) {
      throw new Error('At least one interest must be provided');
    }
  }
 
  /**
   * Get activities that match user interests and fit within budget
   * Uses database queries with filtering and sorting
   */
  async getMatchingActivities(interests, budget) {
    try {
      const query = `
        SELECT 
          a.id,
          a.name,
          a.category,
          a.cost,
          d.name AS destination_name,
          d.city,
          ST_X(a.geom) AS longitude,
          ST_Y(a.geom) AS latitude
        FROM activities a
        JOIN destinations d ON a.destination_id = d.id
        WHERE 
          a.category = ANY($1)
          AND a.cost <= $2
        ORDER BY d.city, a.cost ASC, a.name ASC
      `;
 
      const result = await pool.query(query, [interests, budget]);
      return result.rows;
 
    } catch (error) {
      console.error('Error fetching activities:', error);
      throw new Error('Failed to fetch activities from database');
    }
  }
 
  /**
   * Distribute activities across days based on budget constraints
   * ENSURES ONE CITY PER DAY - all activities in a day are from the same city
   */
  distributeActivitiesAcrossDays(activities, totalDays, budgetPerDay) {
    const itinerary = [];
    // Step 1: Group activities by city
    const activitiesByCity = this.groupActivitiesByCity(activities);
    // Step 2: Get list of cities
    const cities = Object.keys(activitiesByCity);
    if (cities.length === 0) {
      return itinerary;
    }
    // Step 3: Assign one city per day
    for (let day = 1; day <= totalDays; day++) {
      // Pick a city (cycle through available cities)
      const cityIndex = (day - 1) % cities.length;
      const selectedCity = cities[cityIndex];
      const cityActivities = activitiesByCity[selectedCity];
      if (!cityActivities || cityActivities.length === 0) {
        continue;
      }
      const dayPlan = {
        day: day,
        city: selectedCity,
        activities: [],
        dailyCost: 0
      };
 
      // Try to add 2-3 activities from this city
      const activitiesPerDay = Math.min(3, cityActivities.length);
      for (let i = 0; i < activitiesPerDay && i < cityActivities.length; i++) {
        const activity = cityActivities[i];
        const remainingBudget = budgetPerDay - dayPlan.dailyCost;
        // Check if activity fits in budget
        if (activity.cost <= remainingBudget) {
          dayPlan.activities.push({
            name: activity.name,
            category: activity.category,
            cost: parseFloat(activity.cost),
            destination: activity.destination_name,
            city: activity.city,
            location: {
              latitude: activity.latitude,
              longitude: activity.longitude
            }
          });
 
          dayPlan.dailyCost += parseFloat(activity.cost);
        }
      }
 
      // Only add day if it has activities
      if (dayPlan.activities.length > 0) {
        itinerary.push(dayPlan);
        // Remove used activities from the city pool
        activitiesByCity[selectedCity] = cityActivities.slice(dayPlan.activities.length);
        // If city is exhausted, remove it from cities list
        if (activitiesByCity[selectedCity].length === 0) {
          cities.splice(cityIndex, 1);
        }
      }
    }
 
    return itinerary;
  }
 
  /**
   * Group activities by city
   * Returns an object where keys are city names and values are arrays of activities
   */
  groupActivitiesByCity(activities) {
    const grouped = {};
    for (const activity of activities) {
      const city = activity.city;
      if (!grouped[city]) {
        grouped[city] = [];
      }
      grouped[city].push(activity);
    }
    return grouped;
  }
 
  /**
   * Calculate total cost of the trip
   */
  calculateTotalCost(itinerary) {
    return itinerary.reduce((total, day) => {
      return total + day.dailyCost;
    }, 0);
  }
 
  /**
   * Save itinerary to database
   * Stores each day's plan in the itineraries table
   */
  async saveItinerary(userId, itinerary, totalCost) {
    try {
      for (const day of itinerary) {
        if (day.activities.length > 0) {
          // Get first destination_id for this day
          const firstActivity = day.activities[0];
          const destinationQuery = `
            SELECT d.id 
            FROM destinations d 
            WHERE d.name = $1 
            LIMIT 1
          `;
          const destResult = await pool.query(destinationQuery, [firstActivity.destination]);
          if (destResult.rows.length > 0) {
            const destinationId = destResult.rows[0].id;
            // Insert itinerary record
            await pool.query(
              `INSERT INTO itineraries (user_id, destination_id, day_number, total_cost) 
               VALUES ($1, $2, $3, $4)`,
              [userId, destinationId, day.day, day.dailyCost]
            );
          }
        }
      }
    } catch (error) {
      console.error('Error saving itinerary:', error);
      // Don't throw error - saving is optional
    }
  }
 
  /**
   * Get nearby destinations using PostGIS spatial queries
   * Useful for finding destinations within a certain radius
   */
  async getNearbyDestinations(longitude, latitude, radiusKm = 50) {
    try {
      const query = `
        SELECT 
          name,
          city,
          ST_Distance(
            geom::geography,
            ST_MakePoint($1, $2)::geography
          ) / 1000 AS distance_km
        FROM destinations
        WHERE ST_DWithin(
          geom::geography,
          ST_MakePoint($1, $2)::geography,
          $3
        )
        ORDER BY distance_km ASC
      `;
 
      const result = await pool.query(query, [longitude, latitude, radiusKm * 1000]);
      return result.rows;
 
    } catch (error) {
      console.error('Error finding nearby destinations:', error);
      throw error;
    }
  }
 
  /**
   * Calculate distance between two activities
   * Uses PostGIS ST_Distance function
   */
  async calculateDistance(activity1Id, activity2Id) {
    try {
      const query = `
        SELECT 
          ST_Distance(
            a1.geom::geography,
            a2.geom::geography
          ) / 1000 AS distance_km
        FROM activities a1, activities a2
        WHERE a1.id = $1 AND a2.id = $2
      `;
 
      const result = await pool.query(query, [activity1Id, activity2Id]);
      return result.rows[0]?.distance_km || 0;
 
    } catch (error) {
      console.error('Error calculating distance:', error);
      return 0;
    }
  }
}
 
module.exports = new TripPlanner();