# SmartRoute API Integration Guide

## 🎯 Bağlı API'lar (Connected APIs)

### 1. **Google Maps Distance Matrix API**
- **Dosya**: `backend/services/googleMaps.js`
- **Route**: `GET /api/distance`
- **Parametreler**: `origin` (string), `destination` (string)
- **Yanıt**: Distance (km), Duration (minutes)
- **Kullanım**:
```javascript
import { getDistance } from './api';
const result = await getDistance('Istanbul', 'Ankara');
```

### 2. **OpenWeather API**
- **Dosya**: `backend/services/weather.js`
- **Route**: `GET /api/weather`
- **Parametreler**: `lat` (number), `lon` (number)
- **Yanıt**: Temperature, Weather condition, Wind speed
- **Kullanım**:
```javascript
import { getWeather } from './api';
const weather = await getWeather(41.0082, 28.9784); // Istanbul
```

### 3. **Trip Planning API**
- **Dosya**: `backend/routes/planRoutes.js`
- **Controller**: `controller/planController.js`
- **Logic**: `backend/logic/tripPlanner.js`

#### 3.1 Create Trip Plan
- **Route**: `POST /api/plan/create`
- **Body**: 
```json
{
  "budget": 500,
  "days": 3,
  "interests": ["nature", "culture"],
  "userId": 1 (optional)
}
```
- **Yanıt**: Complete itinerary with daily plans

#### 3.2 Get Nearby Destinations
- **Route**: `GET /api/plan/nearby`
- **Parametreler**: `longitude`, `latitude`, `radius` (optional)
- **Yanıt**: List of nearby destinations

#### 3.3 Calculate Distance Between Activities
- **Route**: `POST /api/plan/distance`
- **Body**:
```json
{
  "activity1Id": 1,
  "activity2Id": 2
}
```
- **Yanıt**: Distance in km

### 4. **User Management API**
- **Dosya**: `backend/routes/userRoutes.js`
- **Routes**:
  - `POST /api/users/register` - Yeni kullanıcı kaydı
  - `POST /api/users/login` - Kullanıcı girişi
  - `GET /api/users/:id` - Kullanıcı bilgisi

## 📋 Frontend API Client

Tüm API çağrıları `frontend/src/api.js` içinde tanımlanmıştır:

```javascript
import {
  createPlan,      // Trip planı oluştur
  getDistance,     // Mesafe hesapla
  getWeather,      // Hava durumunu al
  getNearby,       // Yakın destinasyonları bul
  calculateDistance // İki aktivite arasındaki mesafeyi hesapla
} from './api';
```

## 🔑 Environment Variables

### Backend (.env)
```
GOOGLE_MAPS_API_KEY=your_key_here
OPENWEATHER_API_KEY=your_key_here
DB_USER=postgres
DB_PASSWORD=your_password
DB_HOST=localhost
DB_NAME=smartroute
PORT=5000
```

### Frontend (.env)
```
VITE_API_URL=http://localhost:5000
```

## 🚀 API Başlatma

### Backend
```bash
cd backend
npm install
node app.js
```

### Frontend
```bash
cd frontend
npm install
npm run dev
```

## 📊 Veri Tabanı Schema

- **users** - Kullanıcı bilgileri
- **destinations** - Gidiş yerleri (PostGIS geometri ile)
- **activities** - Aktiviteler (maliyet, kategori, konum)
- **itineraries** - Oluşturulan gezi planları

## ✅ Tamamlanmış Entegrasyonlar

- ✅ Google Maps mesafe hesaplama
- ✅ OpenWeather hava durumu
- ✅ Backend API routes
- ✅ Frontend API client
- ✅ Trip planning logic
- ✅ Database configuration
- ✅ User authentication routes
- ✅ PostGIS spatial queries

## 🔄 Veri Akışı

1. **Frontend** (`Plan.jsx`) → Form gönderir
2. **Backend** (`planController.js`) → Verileri doğrular
3. **tripPlanner.js** → Veritabanından aktiviteleri alır
4. **Services** → Google Maps ve Weather API çağırır
5. **Frontend** (`Results.jsx`) → Sonuçları gösterir
