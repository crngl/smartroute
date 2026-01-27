const express = require('express');
const router = express.Router();
const planController = require('../../controller/planController');

/**
 * SmartRoute AI - Plan Routes
 * Developer: Sana Dizmari
 * 
 * API endpoints for trip planning functionality
 */

/**
 * POST /api/plan/create
 * Create a personalized trip plan
 * 
 * Body:
 * {
 *   "budget": 500,
 *   "days": 3,
 *   "interests": ["nature", "culture"],
 *   "userId": 1 (optional)
 * }
 */
router.post('/create', planController.createPlan);

/**
 * GET /api/plan/nearby
 * Get destinations near a location
 * 
 * Query params:
 * - longitude: number
 * - latitude: number
 * - radius: number (km, optional, default: 50)
 */
router.get('/nearby', planController.getNearby);

/**
 * POST /api/plan/distance
 * Calculate distance between two activities
 * 
 * Body:
 * {
 *   "activity1Id": 1,
 *   "activity2Id": 2
 * }
 */
router.post('/distance', planController.calculateDistance);

module.exports = router;