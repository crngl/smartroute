const axios = require("axios");

async function getDistanceKmMin({ origin, destination }) {
  if (!origin || !destination) {
    throw new Error("origin and destination are required");
  }

  const url = "https://maps.googleapis.com/maps/api/distancematrix/json";
  const params = {
    origins: origin,
    destinations: destination,
    key: process.env.GOOGLE_MAPS_API_KEY,
  };

  const { data } = await axios.get(url, { params });

  const element = data?.rows?.[0]?.elements?.[0];
  if (!element || element.status !== "OK") {
    throw new Error("Google Maps API error");
  }

  return {
    origin,
    destination,
    distance_km: element.distance.value / 1000,
    duration_min: element.duration.value / 60,
  };
}

module.exports = { getDistanceKmMin };
