const API_URL = "http://localhost:5000";

/**
 * Create a new trip plan
 * @param {Object} payload - { budget, days, interests, userId? }
 */
export async function createPlan(payload) {
  const res = await fetch(`${API_URL}/api/plan/create`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(payload),
  });

  const data = await res.json().catch(() => null);

  if (!res.ok) {
    throw new Error(data?.error || "Plan oluşturulamadı");
  }

  return data;
}

/**
 * Get distance and duration between two locations
 * @param {string} origin - Origin location (e.g., "Istanbul")
 * @param {string} destination - Destination location (e.g., "Ankara")
 */
export async function getDistance(origin, destination) {
  if (!origin || !destination) {
    throw new Error("Origin ve destination gereklidir");
  }

  const res = await fetch(
    `${API_URL}/api/distance?origin=${encodeURIComponent(origin)}&destination=${encodeURIComponent(destination)}`
  );

  const data = await res.json().catch(() => null);

  if (!res.ok) {
    throw new Error(
      data?.error || "Mesafe hesaplanamadı. Google Maps API key'ini kontrol et."
    );
  }

  return data.data;
}

/**
 * Get current weather for a location
 * @param {number} lat - Latitude
 * @param {number} lon - Longitude
 */
export async function getWeather(lat, lon) {
  if (lat === undefined || lon === undefined) {
    throw new Error("Latitude ve longitude gereklidir");
  }

  const latNum = parseFloat(lat);
  const lonNum = parseFloat(lon);

  if (isNaN(latNum) || isNaN(lonNum)) {
    throw new Error("Latitude ve longitude sayı olmalıdır");
  }

  if (latNum < -90 || latNum > 90 || lonNum < -180 || lonNum > 180) {
    throw new Error("Geçersiz koordinatlar");
  }

  const res = await fetch(`${API_URL}/api/weather?lat=${latNum}&lon=${lonNum}`);

  const data = await res.json().catch(() => null);

  if (!res.ok) {
    throw new Error(
      data?.error || "Hava durumu alınamadı. OpenWeather API key'ini kontrol et."
    );
  }

  return data.data;
}

/**
 * Get nearby destinations
 * @param {number} longitude - Longitude
 * @param {number} latitude - Latitude
 * @param {number} radius - Search radius in km (optional, default: 50)
 */
export async function getNearby(longitude, latitude, radius = 50) {
  if (longitude === undefined || latitude === undefined) {
    throw new Error("Longitude ve latitude gereklidir");
  }

  const res = await fetch(
    `${API_URL}/api/plan/nearby?longitude=${longitude}&latitude=${latitude}&radius=${radius}`
  );

  const data = await res.json().catch(() => null);

  if (!res.ok) {
    throw new Error(data?.error || "Yakın destinasyonlar bulunamadı");
  }

  return data.destinations || [];
}

/**
 * Calculate distance between two activities
 * @param {number} activity1Id - First activity ID
 * @param {number} activity2Id - Second activity ID
 */
export async function calculateDistance(activity1Id, activity2Id) {
  const res = await fetch(`${API_URL}/api/plan/distance`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ activity1Id, activity2Id }),
  });

  const data = await res.json().catch(() => null);

  if (!res.ok) {
    throw new Error(data?.error || "Mesafe hesaplanamadı");
  }

  return data;
}
