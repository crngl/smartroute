const tripPlanner = require('../backend/logic/tripPlanner');

/**
 * SmartRoute AI - Plan Controller
 * Developer: Sana Dizmari
 * 
 * Handles HTTP requests for trip planning endpoints
 */

const planController = {
  
  /**
   * POST /api/plan/create
   * Create a new trip plan based on user preferences
   */
  createPlan: async (req, res) => {
    try {
      const { budget, days, interests, userId } = req.body;

      // Validation
      if (!budget) {
        return res.status(400).json({
          success: false,
          error: 'Budget is required'
        });
      }

      if (!days) {
        return res.status(400).json({
          success: false,
          error: 'Number of days is required'
        });
      }

      if (!interests || !Array.isArray(interests) || interests.length === 0) {
        return res.status(400).json({
          success: false,
          error: 'At least one interest is required (e.g., ["nature", "culture", "food"])'
        });
      }

      // Call trip planner
      const result = await tripPlanner.createTripPlan({
        budget: parseFloat(budget),
        days: parseInt(days),
        interests: interests,
        userId: userId || null
      });

      res.status(201).json(result);

    } catch (error) {
      console.error('Create plan error:', error);
      res.status(400).json({
        success: false,
        error: error.message || 'Failed to create trip plan'
      });
    }
  },

  /**
   * GET /api/plan/nearby
   * Get nearby destinations based on coordinates
   */
  getNearby: async (req, res) => {
    try {
      const { longitude, latitude, radius } = req.query;

      if (!longitude || !latitude) {
        return res.status(400).json({
          success: false,
          error: 'Longitude and latitude are required'
        });
      }

      const destinations = await tripPlanner.getNearbyDestinations(
        parseFloat(longitude),
        parseFloat(latitude),
        radius ? parseFloat(radius) : 50
      );

      res.json({
        success: true,
        count: destinations.length,
        destinations: destinations
      });

    } catch (error) {
      console.error('Get nearby error:', error);
      res.status(500).json({
        success: false,
        error: 'Failed to get nearby destinations'
      });
    }
  },

  /**
   * POST /api/plan/distance
   * Calculate distance between two activities
   */
  calculateDistance: async (req, res) => {
    try {
      const { activity1Id, activity2Id } = req.body;

      if (!activity1Id || !activity2Id) {
        return res.status(400).json({
          success: false,
          error: 'Both activity IDs are required'
        });
      }

      const distance = await tripPlanner.calculateDistance(
        parseInt(activity1Id),
        parseInt(activity2Id)
      );

      res.json({
        success: true,
        distance_km: distance
      });

    } catch (error) {
      console.error('Calculate distance error:', error);
      res.status(500).json({
        success: false,
        error: 'Failed to calculate distance'
      });
    }
  }
};

module.exports = planController;