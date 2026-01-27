# 🚀 SmartRoute API - Başlama Rehberi

## 📋 Ön Koşullar

- **Node.js** 16+ ve **npm**
- **PostgreSQL** 12+ (PostGIS extension ile)
- **Google Maps API Key** (https://cloud.google.com/maps-platform)
- **OpenWeather API Key** (https://openweathermap.org/api)

---

## 🛠️ Kurulum Adımları

### 1️⃣ Backend Kurulumu

```bash
cd backend

# Bağımlılıkları yükle
npm install

# .env dosyasını ayarla
cp .env.example .env
# Şunları düzenle:
# - GOOGLE_MAPS_API_KEY
# - OPENWEATHER_API_KEY
# - DB_PASSWORD

# Veritabanını hazırla (PostgreSQL çalışıyor mu kontrol et)
# PostgreSQL'de bu komutları çalıştır:
# CREATE DATABASE smartroute;
# CREATE EXTENSION postgis;

# Backend sunucusunu başlat
node app.js
```

**Beklenen çıktı:**
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🚀 SmartRoute AI Backend
📡 Server: http://localhost:5000
📝 Environment: development
👥 Team: Dilara, Sana, Ceren, Esra
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

### 2️⃣ Frontend Kurulumu

```bash
cd frontend

# Bağımlılıkları yükle
npm install

# .env dosyasını ayarla
# VITE_API_URL=http://localhost:5000

# Development sunucusunu başlat
npm run dev
```

**Beklenen çıktı:**
```
VITE v... ready in XXX ms

➜  Local:   http://localhost:5173/
```

---

## 📡 API Endpoints

### **Trip Planning**
- `POST /api/plan/create` - Trip planı oluştur
- `GET /api/plan/nearby` - Yakın destinasyonları bul
- `POST /api/plan/distance` - Mesafe hesapla

### **External APIs**
- `GET /api/distance` - Google Maps mesafe
- `GET /api/weather` - Hava durumu

### **User Management**
- `POST /api/users/register` - Yeni kullanıcı
- `POST /api/users/login` - Kullanıcı girişi
- `GET /api/users/:id` - Kullanıcı bilgisi

---

## 🧪 API Testing (cURL örnekleri)

### Hava Durumu Al
```bash
curl "http://localhost:5000/api/weather?lat=41.0082&lon=28.9784"
```

### Mesafe Hesapla
```bash
curl "http://localhost:5000/api/distance?origin=Istanbul&destination=Ankara"
```

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

### Yakın Destinasyonları Bul
```bash
curl "http://localhost:5000/api/plan/nearby?longitude=28.9784&latitude=41.0082&radius=50"
```

---

## 📁 Proje Yapısı

```
smartroute/
├── backend/
│   ├── app.js              # Ana uygulama
│   ├── package.json
│   ├── .env                # API anahtarları
│   ├── config/
│   │   └── database.js     # PostgreSQL bağlantı
│   ├── routes/
│   │   ├── planRoutes.js   # Trip planning routes
│   │   ├── userRoutes.js   # User management
│   │   └── externalApis.js # Google Maps, Weather
│   ├── services/
│   │   ├── googleMaps.js   # Google Maps servisi
│   │   └── weather.js      # OpenWeather servisi
│   ├── logic/
│   │   └── tripPlanner.js  # Trip planning logic
│   ├── controller/
│   │   └── planController.js
│   └── database/
│       ├── schema.sql      # DB şeması
│       ├── seed.sql        # Test verileri
│       └── queries.sql
│
├── frontend/
│   ├── package.json
│   ├── .env
│   ├── src/
│   │   ├── api.js          # API client
│   │   ├── App.jsx         # Ana component
│   │   ├── Plan.jsx        # Trip form
│   │   ├── Results.jsx     # Sonuçlar
│   │   ├── main.jsx
│   │   ├── App.css
│   │   └── index.css
│   ├── index.html
│   └── vite.config.js
│
└── API_INTEGRATION.md      # API dökümantasyonu
```

---

## 🔧 Sorun Giderme

### "Database connection error"
- PostgreSQL'nin çalıştığını kontrol et: `psql -U postgres`
- Database'i oluştur: `CREATE DATABASE smartroute;`
- .env dosyasında veritabanı bilgilerini kontrol et

### "API key not found"
- .env dosyasında GOOGLE_MAPS_API_KEY ve OPENWEATHER_API_KEY'i ayarla
- API anahtarlarının geçerli olduğunu kontrol et

### "CORS Error"
- Backend'de CORS enabled mi kontrol et (app.js line 15)
- Frontend API_URL'si doğru mu kontrol et

### "Cannot find module"
```bash
# Bağımlılıkları yeniden yükle
npm install
```

---

## ✅ Kontrol Listesi

- [ ] PostgreSQL çalışıyor
- [ ] PostGIS extension kurulu
- [ ] Google Maps API key geçerli
- [ ] OpenWeather API key geçerli
- [ ] Backend .env dosyası ayarlandı
- [ ] Backend başlatıldı (localhost:5000)
- [ ] Frontend .env dosyası ayarlandı
- [ ] Frontend başlatıldı (localhost:5173)
- [ ] Frontend'den backend'e API çağrıları yapıldı

---

## 📚 Ek Kaynaklar

- [Google Maps API Docs](https://developers.google.com/maps)
- [OpenWeather API Docs](https://openweathermap.org/api)
- [PostGIS Documentation](https://postgis.net/documentation/)
- [Express.js Guide](https://expressjs.com/)
- [React Documentation](https://react.dev/)

---

## 👥 Geliştirici Ekibi

- **Dilara Ünal** - User Management
- **Sana Dizmari** - Trip Planning
- **Ceren Göl** - Frontend Design
- **Zeynep Esra İdiz** - External APIs

Version: 1.0.0 | Last Updated: 2026-01-27
