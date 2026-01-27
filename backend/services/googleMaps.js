const axios = require("axios");

async function getDistanceKmMin({ origin, destination }) {
  if (!origin || !destination) {
    throw new Error("origin and destination are required");
  }

  // Check if API key is configured
  if (!process.env.GOOGLE_MAPS_API_KEY) {
    throw new Error(
      "Google Maps API key is not configured. Please set GOOGLE_MAPS_API_KEY in .env file"
    );
  }

  const url = "https://maps.googleapis.com/maps/api/distancematrix/json";
  const params = {
    origins: origin,
    destinations: destination,
    key: process.env.GOOGLE_MAPS_API_KEY,
  };

  try {
    const { data } = await axios.get(url, { params });

    // Check for API errors
    if (data.status !== "OK") {
      throw new Error(`Google Maps API error: ${data.error_message || data.status}`);
    }

    const element = data?.rows?.[0]?.elements?.[0];
    if (!element) {
      throw new Error("No route found between the specified locations");
    }

    if (element.status !== "OK") {
      throw new Error(`Route error: ${element.status}`);
    }

    return {
      origin,
      destination,
      distance_km: element.distance.value / 1000,
      duration_min: element.duration.value / 60,
    };
  } catch (error) {
    if (error.response?.status === 403) {
      throw new Error("Google Maps API key is invalid or not authorized");
    }
    throw error;
  }
}

module.exports = { getDistanceKmMin };
