@echo off
REM SmartRoute API Bağlantı Test Scripti (Windows)

echo.
echo 🧪 SmartRoute API Test Başlıyor...
echo ==================================

REM Backend çalışıyor mu test et
echo 📡 Backend kontrol ediliyor...
timeout /t 1 /nobreak > nul
powershell -Command "try { $response = Invoke-WebRequest -Uri 'http://localhost:5000/' -UseBasicParsing -ErrorAction SilentlyContinue; if ($response.StatusCode -eq 200) { Write-Host '✅ Backend çalışıyor (localhost:5000)' } else { Write-Host '❌ Backend yanıt vermiyor' } } catch { Write-Host '❌ Backend yanıt vermiyor. Lütfen: node backend/app.js' }" > nul 2>&1

REM Basit kontrol
for /f %%A in ('powershell -Command "try { $r = Invoke-WebRequest -Uri 'http://localhost:5000/' -UseBasicParsing -ErrorAction SilentlyContinue; echo 1 } catch { echo 0 }"') do set BACKEND=%%A

if "%BACKEND%"=="1" (
    echo ✅ Backend çalışıyor (localhost:5000)
) else (
    echo ❌ Backend yanıt vermiyor. Lütfen: node backend/app.js
    pause
    exit /b 1
)

REM Frontend çalışıyor mu test et
echo 🎨 Frontend kontrol ediliyor...
for /f %%A in ('powershell -Command "try { $r = Invoke-WebRequest -Uri 'http://localhost:5173/' -UseBasicParsing -ErrorAction SilentlyContinue; echo 1 } catch { echo 0 }"') do set FRONTEND=%%A

if "%FRONTEND%"=="1" (
    echo ✅ Frontend çalışıyor (localhost:5173)
) else (
    echo ⚠️  Frontend yanıt vermiyor. Lütfen: cd frontend ^&^& npm run dev
)

echo.
echo 🔍 API Endpoints Test Ediliyor...
echo ==================================

REM 1. Health Check
echo 1️⃣  Health Check: GET /
powershell -Command "Invoke-WebRequest -Uri 'http://localhost:5000/' -UseBasicParsing | ConvertFrom-Json | ConvertTo-Json -Depth 4"

REM 2. Distance API
echo.
echo 2️⃣  Distance API: GET /api/distance
echo ⚠️  ^(GOOGLE_MAPS_API_KEY ayarlanırsa çalışır^)

REM 3. Weather API
echo.
echo 3️⃣  Weather API: GET /api/weather
echo ⚠️  ^(OPENWEATHER_API_KEY ayarlanırsa çalışır^)

REM 4. Create Plan
echo.
echo 4️⃣  Create Plan: POST /api/plan/create
echo ⚠️  ^(Database ayarlanırsa çalışır^)

echo.
echo ==================================
echo ✅ Test tamamlandı!
echo.
echo 📋 Gerekli Ayarlamalar:
echo   1. backend\.env dosyasında API key'lerini ekle
echo   2. PostgreSQL'de smartroute database'ini oluştur
echo   3. PostGIS extension'ı kur
echo   4. Backend ve Frontend'i başlat
echo.
pause
