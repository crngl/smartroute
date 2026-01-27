const express = require("express");
const { getDistanceKmMin } = require("../services/googleMaps");
const { getCurrentWeather } = require("../services/weather");

const router = express.Router();

// GET /api/distance?origin=...&destination=...
router.get("/distance", async (req, res) => {
  try {
    const { origin, destination } = req.query;

    if (!origin || !destination) {
      return res.status(400).json({
        ok: false,
        error: "Both 'origin' and 'destination' query parameters are required",
      });
    }

    const result = await getDistanceKmMin({ origin, destination });
    res.json({ ok: true, data: result });
  } catch (err) {
    console.error("Distance API error:", err.message);
    res.status(400).json({
      ok: false,
      error: err.message || "Failed to calculate distance",
    });
  }
});

// GET /api/weather?lat=...&lon=...
router.get("/weather", async (req, res) => {
  try {
    const { lat, lon } = req.query;

    if (lat === undefined || lon === undefined) {
      return res.status(400).json({
        ok: false,
        error: "Both 'lat' and 'lon' query parameters are required",
      });
    }

    const latNum = parseFloat(lat);
    const lonNum = parseFloat(lon);

    if (isNaN(latNum) || isNaN(lonNum)) {
      return res.status(400).json({
        ok: false,
        error: "'lat' and 'lon' must be valid numbers",
      });
    }

    const result = await getCurrentWeather({ lat: latNum, lon: lonNum });
    res.json({ ok: true, data: result });
  } catch (err) {
    console.error("Weather API error:", err.message);
    res.status(400).json({
      ok: false,
      error: err.message || "Failed to fetch weather data",
    });
  }
});

module.exports = router;