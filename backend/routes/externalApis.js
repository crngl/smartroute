const express = require("express");
const { getDistanceKmMin } = require("../services/googleMaps");
const { getCurrentWeather } = require("../services/weather");

const router = express.Router();

// GET /api/distance?origin=...&destination=...
router.get("/distance", async (req, res) => {
  try {
    const { origin, destination } = req.query;
    const result = await getDistanceKmMin({ origin, destination });
    res.json({ ok: true, data: result });
  } catch (err) {
    res.status(400).json({ ok: false, error: err.message });
  }
});

// GET /api/weather?lat=...&lon=...
router.get("/weather", async (req, res) => {
  try {
    const { lat, lon } = req.query;
    const result = await getCurrentWeather({ lat, lon });
    res.json({ ok: true, data: result });
  } catch (err) {
    res.status(400).json({ ok: false, error: err.message });
  }
});

module.exports = router;