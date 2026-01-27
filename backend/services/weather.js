const axios = require("axios");

async function getCurrentWeather({ lat, lon, units = "metric" }) {
  if (lat == null || lon == null) {
    throw new Error("lat and lon are required");
  }

  const url = "https://api.openweathermap.org/data/2.5/weather";
  const params = {
    lat,
    lon,
    units,
    appid: process.env.OPENWEATHER_API_KEY,
  };

  const { data } = await axios.get(url, { params });

  return {
    lat: Number(lat),
    lon: Number(lon),
    temp_c: data?.main?.temp,
    condition: data?.weather?.[0]?.main,
    description: data?.weather?.[0]?.description,
    wind_mps: data?.wind?.speed,
  };
}

module.exports = { getCurrentWeather };