# 🔑 API Key Alma Rehberi

## ⚠️ Neden API Key Gerekli?

Hava ve konum API'ları harici servislerden veri çektiği için geçerli API anahtarları gereklidir. Siz olmadan bu API'lar çalışmaz!

---

## 1️⃣ Google Maps API Key

### Adım 1: Google Cloud Console'a Gideyin
👉 https://console.cloud.google.com/

### Adım 2: Yeni Proje Oluşturun
```
1. "Select a Project" → "+ Create NEW PROJECT"
2. Project name: "SmartRoute" (veya istediğiniz isim)
3. "Create" düğmesine tıklayın
4. Proje oluşturulunca seç
```

### Adım 3: Distance Matrix API'yi Enable Edin
```
1. Sol menüde "APIs & Services" → "Library" seçin
2. Arama kutusuna "Distance Matrix API" yazın
3. Sonuçta "Distance Matrix API" seçin
4. "ENABLE" düğmesine tıklayın
```

### Adım 4: API Key Oluşturun
```
1. "Credentials" seçin (sol menü)
2. "+ CREATE CREDENTIALS" → "API Key" seçin
3. Açılır pencerede gösterilen key'i kopyalayın
4. (Opsiyonel) "API Key constraints" ile key'i güvenleştirin
```

### Adım 5: .env'ye Ekleyin
```bash
# backend/.env dosyasını açın ve şunu ekleyin:
GOOGLE_MAPS_API_KEY=AIzaSyXxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

### ✅ Test Edin
```bash
curl "http://localhost:5000/api/distance?origin=Istanbul&destination=Ankara"
```

---

## 2️⃣ OpenWeather API Key

### Adım 1: OpenWeather Sitesine Gideyin
👉 https://openweathermap.org/api

### Adım 2: Ücretsiz Plan'a Kaydolun
```
1. "Sign Up" tıklayın
2. Email, username, password girin
3. "Create Account" tıklayın
4. Email'den confirmation linkine tıklayın
```

### Adım 3: API Key'i Bulun
```
1. Login yaptıktan sonra "Account" → "API Keys" seçin
2. "Default" veya kendi oluşturduğunuz key'i kopyalayın
3. Eğer hiç key yoksa "Generate" düğmesine tıklayın
```

### Adım 4: .env'ye Ekleyin
```bash
# backend/.env dosyasını açın ve şunu ekleyin:
OPENWEATHER_API_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

### ✅ Test Edin
```bash
curl "http://localhost:5000/api/weather?lat=41.0082&lon=28.9784"
```

---

## 📋 .env Dosyası Şablonu

```env
# Database Configuration
DB_USER=postgres
DB_HOST=localhost
DB_NAME=smartroute
DB_PASSWORD=your_password
DB_PORT=5432

# Server
PORT=5000
NODE_ENV=development

# ✨ GEREKLİ API KEY'LER:

# Google Maps Distance Matrix API
# Alma: https://console.cloud.google.com/
# Format: AIzaSyXxxxxxxxxxxxxxxxxxxxxxxxxxxx
GOOGLE_MAPS_API_KEY=your_google_maps_key_here

# OpenWeather Current Weather API
# Alma: https://openweathermap.org/api
# Format: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
OPENWEATHER_API_KEY=your_openweather_key_here

# JWT Secret
JWT_SECRET=your_jwt_secret_key_here
```

---

## 🚀 Kurulumdan Sonra Test Et

### 1. Backend'i Başlat
```bash
cd backend
npm install
node app.js
```

**Beklenen çıktı:**
```
🚀 SmartRoute AI Backend
📡 Server: http://localhost:5000
```

### 2. Test API Call'ları Yap

**Google Maps (Mesafe):**
```bash
curl "http://localhost:5000/api/distance?origin=Istanbul&destination=Ankara"
```

**Beklenen başarılı yanıt:**
```json
{
  "ok": true,
  "data": {
    "origin": "Istanbul",
    "destination": "Ankara",
    "distance_km": 450.123,
    "duration_min": 420
  }
}
```

**OpenWeather (Hava):**
```bash
curl "http://localhost:5000/api/weather?lat=41.0082&lon=28.9784"
```

**Beklenen başarılı yanıt:**
```json
{
  "ok": true,
  "data": {
    "lat": 41.0082,
    "lon": 28.9784,
    "temp_c": 15,
    "condition": "Clear",
    "description": "clear sky",
    "wind_mps": 3.5,
    "humidity": 65,
    "pressure": 1013
  }
}
```

---

## ⚠️ Sık Sorulan Hatalar

### ❌ "Google Maps API key is not configured"
```
Çözüm: backend/.env dosyasını kontrol et
GOOGLE_MAPS_API_KEY= (boş olmamalı!)
```

### ❌ "Google Maps API key is invalid or not authorized"
```
Çözüm: 
1. Key'i yeniden kopyala
2. Distance Matrix API'nin enable edildiğini kontrol et
3. Key'in doğru format'ta olduğunu kontrol et (AIza... ile başlıyor mı?)
```

### ❌ "OpenWeather API key is not configured"
```
Çözüm: backend/.env dosyasını kontrol et
OPENWEATHER_API_KEY= (boş olmamalı!)
```

### ❌ "Location not found"
```
Çözüm: Koordinatları kontrol et (-90 to 90 lat, -180 to 180 lon)
Örnek: lat=41.0082&lon=28.9784 (İstanbul)
```

### ❌ "Invalid latitude or longitude values"
```
Çözüm: 
- Latitude: -90 ile 90 arasında olmalı
- Longitude: -180 ile 180 arasında olmalı
```

---

## 🌍 Bazı Örnek Koordinatlar

```
İstanbul:     lat=41.0082, lon=28.9784
Ankara:       lat=39.9334, lon=32.8597
İzmir:        lat=38.4161, lon=27.1382
Antalya:      lat=36.8969, lon=30.7133
Cappadocia:   lat=38.7469, lon=34.5541
```

---

## 💰 Fiyatlandırma

### Google Maps (Pay-as-you-go)
- İlk 200$ ücretsiz kredi
- Her aybaşı yenilenir
- Sonra per-request ücret

### OpenWeather (Ücretsiz)
- Ücretsiz plan: 1000 call/day
- Professional: İsteğe bağlı

---

## 📞 Destek

**Sorun yaşıyorsanız:**
1. API key'nin geçerli olduğunu kontrol et
2. Backend'in çalıştığını kontrol et: `curl http://localhost:5000/`
3. .env dosyasında typo var mı kontrol et
4. Terminal'deki error message'ı oku

---

**🎉 API Key'ler kurulduktan sonra tüm API'lar çalışacak!**
