const express = require('express');
const cors = require('cors');
require('dotenv').config();

const userRoutes = require('./routes/userRoutes');
const planRoutes = require('./routes/planRoutes'); // SANA - Trip Planning
const externalApis = require('./routes/externalApis'); // ESRA - External APIs

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Request logging
app.use((req, res, next) => {
  console.log(`${req.method} ${req.path}`);
  next();
});

// Routes
app.use('/api/users', userRoutes); // DILARA - User Management
app.use('/api/plan', planRoutes); // SANA - Trip Planning
app.use('/api', externalApis); // ESRA - External APIs (Google Maps, Weather)

// Health check
app.get('/', (req, res) => {
  res.json({
    message: '🚀 SmartRoute AI Backend',
    version: '1.0.0',
    status: 'running',
    developers: 'Dilara Ünal, Sana Dizmari, Ceren Göl, Zeynep Esra İdiz',
    timestamp: new Date().toISOString()
  });
});

// 404 handler
app.use((req, res) => {
  res.status(404).json({
    success: false,
    error: 'Route not found'
  });
});

// Error handler
app.use((err, req, res, next) => {
  console.error('Server error:', err);
  res.status(500).json({
    success: false,
    error: 'Internal server error'
  });
});

// Start server
app.listen(PORT, () => {
  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  console.log('🚀 SmartRoute AI Backend');
  console.log(`📡 Server: http://localhost:${PORT}`);
  console.log(`📝 Environment: ${process.env.NODE_ENV || 'development'}`);
  console.log('👥 Team: Dilara, Sana, Ceren, Esra');
  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
});