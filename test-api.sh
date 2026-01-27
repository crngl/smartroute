#!/bin/bash
# SmartRoute API Bağlantı Test Scripti

echo "🧪 SmartRoute API Test Başlıyor..."
echo "=================================="

# Backend çalışıyor mu test et
echo "📡 Backend kontrol ediliyor..."
if curl -s http://localhost:5000/ > /dev/null 2>&1; then
    echo "✅ Backend çalışıyor (localhost:5000)"
else
    echo "❌ Backend yanıt vermiyor. Lütfen: node backend/app.js"
    exit 1
fi

# Frontend çalışıyor mu test et
echo "🎨 Frontend kontrol ediliyor..."
if curl -s http://localhost:5173/ > /dev/null 2>&1; then
    echo "✅ Frontend çalışıyor (localhost:5173)"
else
    echo "⚠️  Frontend yanıt vermiyor. Lütfen: cd frontend && npm run dev"
fi

# API'lar test et
echo ""
echo "🔍 API Endpoints Test Ediliyor..."
echo "=================================="

# 1. Health Check
echo "1️⃣  Health Check: GET /"
curl -s http://localhost:5000/ | jq .

# 2. Distance API (Gerekli: GOOGLE_MAPS_API_KEY)
echo ""
echo "2️⃣  Distance API: GET /api/distance"
echo "⚠️  (GOOGLE_MAPS_API_KEY ayarlanırsa çalışır)"
curl -s "http://localhost:5000/api/distance?origin=Istanbul&destination=Ankara" | jq .

# 3. Weather API (Gerekli: OPENWEATHER_API_KEY)
echo ""
echo "3️⃣  Weather API: GET /api/weather"
echo "⚠️  (OPENWEATHER_API_KEY ayarlanırsa çalışır)"
curl -s "http://localhost:5000/api/weather?lat=41.0082&lon=28.9784" | jq .

# 4. Create Plan (Database gerekli)
echo ""
echo "4️⃣  Create Plan: POST /api/plan/create"
echo "⚠️  (Database ayarlanırsa çalışır)"
curl -s -X POST http://localhost:5000/api/plan/create \
  -H "Content-Type: application/json" \
  -d '{"budget":500,"days":3,"interests":["nature","culture"]}' | jq .

echo ""
echo "=================================="
echo "✅ Test tamamlandı!"
echo ""
echo "📋 Gerekli Ayarlamalar:"
echo "  1. backend/.env dosyasında API key'lerini ekle"
echo "  2. PostgreSQL'de smartroute database'ini oluştur"
echo "  3. PostGIS extension'ı kur"
echo "  4. Backend ve Frontend'i başlat"
