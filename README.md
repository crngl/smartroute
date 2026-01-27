# 🗺️ SmartRoute - AI-Powered Trip Planning Application

> **Akıllı gezi planlama uygulaması - Budget ve ilgi alanlarına göre kişiselleştirilmiş itinerary oluşturma**

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![Status](https://img.shields.io/badge/status-production%20ready-green)
![License](https://img.shields.io/badge/license-MIT-green)

---

## 🎯 Özellikler

- 💰 **Budget-Tabanlı Planlama** - Bütçeye uygun aktiviteleri otomatik filtrele
- 🎯 **İlgi Alanı Seçimi** - Culture, Nature, Food, Adventure, History, Beach seçenekleri
- 📍 **Konum-Tabanlı Önerier** - PostGIS ile yakın destinasyonları bul
- 🌤️ **Gerçek-Zamanlı Hava Durumu** - OpenWeather API ile güncel hava
- 📏 **Mesafe Hesaplama** - Google Maps API ile mesafe ve süre
- 👤 **Kullanıcı Yönetimi** - Kayıt, giriş ve profil yönetimi
- 💾 **Gezi Geçmişi** - Oluşturulan planları veritabanında sakla
- 🚀 **Hızlı API'lar** - Axios ile optimized HTTP istekleri

---

## 🛠️ Tech Stack

### Backend
- **Runtime**: Node.js 16+
- **Framework**: Express.js 5.2.1
- **Database**: PostgreSQL 12+ (PostGIS extension)
- **HTTP Client**: Axios 1.13.3
- **Security**: CORS, dotenv
- **APIs**: Google Maps, OpenWeather

### Frontend
- **Library**: React 19.2.0
- **Build Tool**: Vite 7.2.4
- **Styling**: CSS + Emoji UI
- **HTTP**: Fetch API
- **State**: React Hooks (useState)

---

## 📦 Kurulum

### Ön Koşullar
```bash
- Node.js 16+
- PostgreSQL 12+
- Google Maps API Key
- OpenWeather API Key
```

### 1️⃣ Clone & Setup
```bash
# Repository'yi clone et
git clone <repo_url>
cd smartroute

# Backend kurulumu
cd backend
npm install

# Frontend kurulumu
cd ../frontend
npm install
```

### 2️⃣ Environment Variables
```bash
# backend/.env
cp .env.example .env
# Şunları düzenle:
GOOGLE_MAPS_API_KEY=your_key
OPENWEATHER_API_KEY=your_key
DB_PASSWORD=your_password

# frontend/.env
VITE_API_URL=http://localhost:5000
```

### 3️⃣ Database Setup
```bash
# PostgreSQL'de
CREATE DATABASE smartroute;
CREATE EXTENSION postgis;

# Schema'yı yükle
psql -U postgres -d smartroute -f database/schema.sql
psql -U postgres -d smartroute -f database/seed.sql
```

### 4️⃣ Başlat
```bash
# Terminal 1: Backend
cd backend
node app.js

# Terminal 2: Frontend
cd frontend
npm run dev
```

**Erişim**: http://localhost:5173

---

## 📡 API Endpoints

### 🗺️ Trip Planning
```
POST   /api/plan/create      - Trip planı oluştur
GET    /api/plan/nearby      - Yakın destinasyonları bul
POST   /api/plan/distance    - Aktivite mesafesi
```

### 🌍 External APIs
```
GET    /api/distance         - Google Maps mesafe
GET    /api/weather          - OpenWeather hava durumu
```

### 👥 User Management
```
POST   /api/users/register   - Yeni kullanıcı kayıt
POST   /api/users/login      - Kullanıcı giriş
GET    /api/users/:id        - Kullanıcı profili
```

---

## 📋 API Kullanım Örnekleri

### Trip Planı Oluştur
```bash
curl -X POST http://localhost:5000/api/plan/create \
  -H "Content-Type: application/json" \
  -d '{
    "budget": 500,
    "days": 3,
    "interests": ["nature", "culture"]
  }'
```

**Response:**
```json
{
  "success": true,
  "plan": {
    "totalDays": 3,
    "totalBudget": 500,
    "totalCost": 420,
    "remainingBudget": 80,
    "itinerary": [
      {
        "day": 1,
        "activities": [...],
        "dailyCost": 150
      }
    ]
  }
}
```

### Hava Durumu Al
```bash
curl "http://localhost:5000/api/weather?lat=41.0082&lon=28.9784"
```

### Mesafe Hesapla
```bash
curl "http://localhost:5000/api/distance?origin=Istanbul&destination=Ankara"
```

---

## 📁 Proje Yapısı

```
smartroute/
├── backend/                    # Express.js API
│   ├── app.js                 # Ana uygulama
│   ├── .env                   # Environment variables
│   ├── package.json
│   ├── config/
│   │   └── database.js        # PostgreSQL bağlantı
│   ├── routes/                # API route'ları
│   │   ├── planRoutes.js
│   │   ├── userRoutes.js
│   │   └── externalApis.js
│   ├── services/              # Dış API servisleri
│   │   ├── googleMaps.js
│   │   └── weather.js
│   ├── logic/
│   │   └── tripPlanner.js     # Trip planning logic
│   ├── controller/
│   │   └── planController.js
│   └── database/
│       ├── schema.sql
│       ├── seed.sql
│       └── queries.sql
│
├── frontend/                   # React SPA
│   ├── .env
│   ├── index.html
│   ├── package.json
│   ├── vite.config.js
│   ├── src/
│   │   ├── api.js             # API client
│   │   ├── App.jsx            # Ana component
│   │   ├── Plan.jsx           # Trip form
│   │   ├── Results.jsx        # Sonuç bileşeni
│   │   ├── main.jsx
│   │   └── styles/
│   └── public/
│
├── database/                   # SQL scripts
│   ├── schema.sql
│   ├── seed.sql
│   └── queries.sql
│
└── 📚 Documentation
    ├── README.md              # Bu dosya
    ├── GETTING_STARTED.md     # Başlama rehberi
    ├── API_INTEGRATION.md     # API dökümantasyonu
    ├── FINAL_SUMMARY.md       # Detaylı rapor
    └── test-api.sh/.bat       # Test scriptleri
```

---

## 🚀 Hızlı Başlama

### Komut Satırı
```bash
# 1. Backend'i başlat
cd backend && node app.js &

# 2. Frontend'i başlat
cd frontend && npm run dev &

# 3. Browser'da aç
# http://localhost:5173
```

### Docker (İsteğe Bağlı)
```bash
docker-compose up
```

---

## 📊 Veri Akışı

```
┌─────────────────────────────────────────────────┐
│           Frontend (React)                      │
│  ┌──────────────────────────────────────────┐  │
│  │  Plan.jsx (Form)  →  api.js (Client)   │  │
│  └──────────────────────────────────────────┘  │
└──────────────────┬──────────────────────────────┘
                   │ HTTP Request
                   ↓
┌──────────────────────────────────────────────────┐
│           Backend (Express)                      │
│  ┌──────────────────────────────────────────┐   │
│  │  app.js  →  routes  →  controller       │   │
│  └──────────────────────────────────────────┘   │
│           ↓                                      │
│  ┌──────────────────────────────────────────┐   │
│  │ tripPlanner.js  →  Database/Services    │   │
│  └──────────────────────────────────────────┘   │
│           ↓                                      │
│  ┌──────────────────────────────────────────┐   │
│  │  googleMaps.js  │  weather.js           │   │
│  │  (External APIs)                        │   │
│  └──────────────────────────────────────────┘   │
└──────────────────┬──────────────────────────────┘
                   │ HTTP Response
                   ↓
┌──────────────────────────────────────────────────┐
│           Frontend (React)                       │
│  Results.jsx (Display)  ← HTTP Response         │
└──────────────────────────────────────────────────┘
```

---

## 🧪 Testing

### API Test
```bash
# Windows
test-api.bat

# Linux/Mac
bash test-api.sh
```

### Manuel Test
```bash
# Health Check
curl http://localhost:5000/

# Trip Planı
curl -X POST http://localhost:5000/api/plan/create \
  -H "Content-Type: application/json" \
  -d '{"budget":500,"days":3,"interests":["nature"]}'
```

---

## 🔐 Security

- ✅ CORS enabled (express-cors)
- ✅ Environment variables (.env)
- ✅ Input validation
- ✅ Error handling
- ✅ Database prepared statements (pg)

**Sonraki Sürümler:**
- [ ] JWT Authentication
- [ ] Rate Limiting
- [ ] Input Sanitization
- [ ] HTTPS/TLS

---

## 📈 Performance

- **Backend**: Express.js optimized routing
- **Database**: PostgreSQL with indexes
- **Frontend**: React lazy loading & memoization
- **Caching**: Redis ready (optional)

---

## 🐛 Troubleshooting

### Backend bağlantı hatası
```bash
# Check if server is running
curl http://localhost:5000/

# Check environment variables
cat backend/.env

# Check database
psql -U postgres -c "SELECT version();"
```

### Frontend API hatası
```bash
# Check API URL in .env
cat frontend/.env

# Check browser console for errors
# F12 → Console tab
```

### Database hatası
```bash
# Connect to PostgreSQL
psql -U postgres -d smartroute

# Check tables
\dt

# Check PostGIS
SELECT postgis_version();
```

---

## 📚 Dokumentasyon

- 📖 [GETTING_STARTED.md](GETTING_STARTED.md) - Kurulum rehberi
- 📖 [API_INTEGRATION.md](API_INTEGRATION.md) - API referansı
- 📖 [FINAL_SUMMARY.md](FINAL_SUMMARY.md) - Detaylı rapor
- 📖 [API_BINDING_SUMMARY.md](API_BINDING_SUMMARY.md) - İş özeti

---

## 🔗 Harici Kaynaklar

- [Express.js Docs](https://expressjs.com/)
- [React Docs](https://react.dev/)
- [PostgreSQL Docs](https://www.postgresql.org/docs/)
- [PostGIS Docs](https://postgis.net/)
- [Google Maps API](https://developers.google.com/maps)
- [OpenWeather API](https://openweathermap.org/api)

---

## 👥 Geliştirici Ekibi

| İsim | Rol | Sorumluluk |
|------|-----|------------|
| Dilara Ünal | Backend Developer | User Management |
| Sana Dizmari | Full-Stack | Trip Planning |
| Ceren Göl | Frontend Developer | UI/UX Design |
| Zeynep Esra İdiz | Backend Developer | External APIs |

---

## 📝 Lisans

MIT License - Lütfen LICENSE dosyasını görmek için bakınız

---

## 🎉 Başarıyla Bağlandı!

**Tüm API'lar başarıyla entegre edildi. Kullanmaya başlamak için:**

```bash
# 1. Backend başlat
cd backend && node app.js

# 2. Frontend başlat  
cd frontend && npm run dev

# 3. Enjoy! 🚀
```

---

**Version**: 1.0.0 | **Last Updated**: 27 Ocak 2026 | **Status**: ✅ Production Ready
