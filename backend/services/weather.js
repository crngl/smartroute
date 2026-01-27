const axios = require("axios");

async function getCurrentWeather({ lat, lon, units = "metric" }) {
  if (lat == null || lon == null) {
    throw new Error("lat and lon are required");
  }

  // Validate latitude and longitude ranges
  if (lat < -90 || lat > 90 || lon < -180 || lon > 180) {
    throw new Error("Invalid latitude or longitude values");
  }

  // Check if API key is configured
  if (!process.env.OPENWEATHER_API_KEY) {
    throw new Error(
      "OpenWeather API key is not configured. Please set OPENWEATHER_API_KEY in .env file"
    );
  }

  const url = "https://api.openweathermap.org/data/2.5/weather";
  const params = {
    lat,
    lon,
    units,
    appid: process.env.OPENWEATHER_API_KEY,
  };

  try {
    const { data } = await axios.get(url, { params });

    // Validate response structure
    if (!data.main || !data.weather) {
      throw new Error("Invalid response from OpenWeather API");
    }

    return {
      lat: Number(lat),
      lon: Number(lon),
      temp_c: data?.main?.temp,
      condition: data?.weather?.[0]?.main,
      description: data?.weather?.[0]?.description,
      wind_mps: data?.wind?.speed,
      humidity: data?.main?.humidity,
      pressure: data?.main?.pressure,
    };
  } catch (error) {
    if (error.response?.status === 401) {
      throw new Error("OpenWeather API key is invalid");
    }
    if (error.response?.status === 404) {
      throw new Error("Location not found");
    }
    throw error;
  }
}

module.exports = { getCurrentWeather };