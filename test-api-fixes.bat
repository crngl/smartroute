@echo off
REM SmartRoute API Hata Testi - Düzeltmeleri Doğrulama (Windows)

echo.
echo 🧪 SmartRoute API HATA FIX TEST
echo ==================================
echo.

set API_URL=http://localhost:5000

REM Test 1: Health Check
echo 1️⃣  Health Check
echo curl %API_URL%/
powershell -Command "Invoke-WebRequest -Uri '%API_URL%/' -UseBasicParsing | Select-Object -ExpandProperty Content | ConvertFrom-Json | ConvertTo-Json"
echo.

REM Test 2: Missing Weather Key
echo 2️⃣  Hava Durumu - API Key Kontrolü (boşsa hata göstermeli)
echo curl "%API_URL%/api/weather?lat=41.0082^&lon=28.9784"
powershell -Command "Invoke-WebRequest -Uri '%API_URL%/api/weather?lat=41.0082&lon=28.9784' -UseBasicParsing | Select-Object -ExpandProperty Content | ConvertFrom-Json | ConvertTo-Json"
echo.

REM Test 3: Invalid Coordinates
echo 3️⃣  Hava Durumu - Geçersiz Koordinatlar
echo curl "%API_URL%/api/weather?lat=200^&lon=300"
powershell -Command "Invoke-WebRequest -Uri '%API_URL%/api/weather?lat=200&lon=300' -UseBasicParsing | Select-Object -ExpandProperty Content | ConvertFrom-Json | ConvertTo-Json"
echo.

REM Test 4: Missing Parameters
echo 4️⃣  Hava Durumu - Eksik Parametreler
echo curl "%API_URL%/api/weather?lat=41.0082"
powershell -Command "Invoke-WebRequest -Uri '%API_URL%/api/weather?lat=41.0082' -UseBasicParsing | Select-Object -ExpandProperty Content | ConvertFrom-Json | ConvertTo-Json"
echo.

REM Test 5: Missing Distance Key
echo 5️⃣  Mesafe - API Key Kontrolü (boşsa hata göstermeli)
echo curl "%API_URL%/api/distance?origin=Istanbul^&destination=Ankara"
powershell -Command "Invoke-WebRequest -Uri '%API_URL%/api/distance?origin=Istanbul&destination=Ankara' -UseBasicParsing | Select-Object -ExpandProperty Content | ConvertFrom-Json | ConvertTo-Json"
echo.

REM Test 6: Missing Distance Parameters
echo 6️⃣  Mesafe - Eksik Parametreler
echo curl "%API_URL%/api/distance?origin=Istanbul"
powershell -Command "Invoke-WebRequest -Uri '%API_URL%/api/distance?origin=Istanbul' -UseBasicParsing | Select-Object -ExpandProperty Content | ConvertFrom-Json | ConvertTo-Json"
echo.

echo ==================================
echo ✅ Testler Tamamlandı!
echo.
echo 📋 Sonuçları İnceleme:
echo   * Her API hatası detaylı mesaj göstermeli
echo   * Hatalar Türkçe olmalı
echo   * Missing key kontrolü çalışmalı
echo   * Koordinat validasyonu çalışmalı
echo.
pause
