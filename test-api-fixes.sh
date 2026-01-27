#!/bin/bash
# SmartRoute API Hata Testi - Düzeltmeleri Doğrulama

echo ""
echo "🧪 SmartRoute API HATA FİKS TEST"
echo "=================================="
echo ""

API_URL="http://localhost:5000"

# Test 1: Health Check
echo "1️⃣  Health Check"
echo "curl $API_URL/"
curl -s "$API_URL/" | jq .
echo ""

# Test 2: Missing Weather Key (Negative Test)
echo "2️⃣  Hava Durumu - API Key Kontrolü (API key boşsa hata göstermeli)"
echo "curl \"$API_URL/api/weather?lat=41.0082&lon=28.9784\""
curl -s "$API_URL/api/weather?lat=41.0082&lon=28.9784" | jq .
echo ""

# Test 3: Invalid Coordinates
echo "3️⃣  Hava Durumu - Geçersiz Koordinatlar"
echo "curl \"$API_URL/api/weather?lat=200&lon=300\""
curl -s "$API_URL/api/weather?lat=200&lon=300" | jq .
echo ""

# Test 4: Missing Parameters
echo "4️⃣  Hava Durumu - Eksik Parametreler"
echo "curl \"$API_URL/api/weather?lat=41.0082\""
curl -s "$API_URL/api/weather?lat=41.0082" | jq .
echo ""

# Test 5: Missing Distance Key
echo "5️⃣  Mesafe - API Key Kontrolü (API key boşsa hata göstermeli)"
echo "curl \"$API_URL/api/distance?origin=Istanbul&destination=Ankara\""
curl -s "$API_URL/api/distance?origin=Istanbul&destination=Ankara" | jq .
echo ""

# Test 6: Missing Distance Parameters
echo "6️⃣  Mesafe - Eksik Parametreler"
echo "curl \"$API_URL/api/distance?origin=Istanbul\""
curl -s "$API_URL/api/distance?origin=Istanbul" | jq .
echo ""

echo "=================================="
echo "✅ Testler Tamamlandı!"
echo ""
echo "📋 Sonuçları İnceleme:"
echo "  • Her API hatası detaylı mesaj göstermeli"
echo "  • Hatalar Türkçe olmalı"
echo "  • Missing key kontrolü çalışmalı"
echo "  • Koordinat validasyonu çalışmalı"
echo ""
