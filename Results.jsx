import { useState } from "react";
import { getWeather, getDistance } from "./api";

function Results({ data, onBack }) {
  const [selectedDay, setSelectedDay] = useState(1);
  const [weatherData, setWeatherData] = useState(null);
  const [loadingWeather, setLoadingWeather] = useState(false);
  const [weatherError, setWeatherError] = useState(null);

  // Backend error formatı
  if (!data || data.success === false) {
    return (
      <div className="results-container">
        <h2>🗺️ Trip Plan</h2>
        <p style={{ color: "#d32f2f" }}>
          ❌ {data?.error || "Plan oluşturulamadı."}
        </p>
        <p style={{ fontSize: "14px", color: "#666" }}>
          Hata: Veritabanını kontrol edin veya parametreleri doğrulayın.
        </p>
        <button onClick={onBack}>← Back</button>
      </div>
    );
  }

  const plan = data.plan;
  const itinerary = plan?.itinerary || [];

  // Get weather for first activity's location
  const handleGetWeather = async (day) => {
    if (itinerary.length === 0) return;

    const selectedItinerary = itinerary.find((d) => d.day === day);
    if (!selectedItinerary || !selectedItinerary.activities.length) return;

    const firstActivity = selectedItinerary.activities[0];
    const { latitude, longitude } = firstActivity.location || {};

    if (!latitude || !longitude) {
      setWeatherError("Konum bilgisi bulunamadı");
      return;
    }

    setLoadingWeather(true);
    setWeatherError(null);
    try {
      const weather = await getWeather(latitude, longitude);
      setWeatherData({ day, ...weather });
    } catch (err) {
      console.error("Weather fetch error:", err);
      setWeatherError(err.message);
      setWeatherData(null);
    } finally {
      setLoadingWeather(false);
    }
  };

  return (
    <div className="results-container">
      <h2>🗺️ Trip Plan</h2>

      <div className="plan-summary">
        <p>
          <strong>📅 Days:</strong> {plan?.totalDays} | <strong>💰 Budget:</strong> {plan?.totalBudget} ₺ |{" "}
          <strong>💵 Total Cost:</strong> {plan?.totalCost} ₺ |{" "}
          <strong>💳 Remaining:</strong> {plan?.remainingBudget} ₺
        </p>
      </div>

      {itinerary.length === 0 ? (
        <p>⚠️ Itinerary boş geldi.</p>
      ) : (
        <>
          <div className="day-selector">
            {itinerary.map((dayObj) => (
              <button
                key={dayObj.day}
                onClick={() => {
                  setSelectedDay(dayObj.day);
                  setWeatherError(null);
                  handleGetWeather(dayObj.day);
                }}
                style={{
                  fontWeight: selectedDay === dayObj.day ? "bold" : "normal",
                  backgroundColor: selectedDay === dayObj.day ? "#007bff" : "#f0f0f0",
                  color: selectedDay === dayObj.day ? "white" : "black",
                  padding: "10px 15px",
                  margin: "5px",
                  border: "none",
                  borderRadius: "5px",
                  cursor: "pointer",
                }}
              >
                Day {dayObj.day}
              </button>
            ))}
          </div>

          {itinerary.map((dayObj) => {
            if (dayObj.day !== selectedDay) return null;

            return (
              <div key={dayObj.day} className="day-card">
                <h3>📍 Day {dayObj.day}</h3>
                <p>💰 Daily Cost: {dayObj.dailyCost} ₺</p>

                {weatherError && (
                  <div style={{ color: "#d32f2f", marginBottom: "10px" }}>
                    ⚠️ {weatherError}
                  </div>
                )}

                {weatherData && weatherData.day === dayObj.day && (
                  <div className="weather-info">
                    <p>
                      <strong>🌤️ Weather:</strong> {weatherData.condition} (
                      {weatherData.description})
                    </p>
                    <p>
                      <strong>🌡️ Temperature:</strong> {weatherData.temp_c}°C |{" "}
                      <strong>💨 Wind:</strong> {weatherData.wind_mps} m/s |{" "}
                      <strong>💧 Humidity:</strong> {weatherData.humidity}%
                    </p>
                  </div>
                )}

                {loadingWeather && <p>⏳ Hava durumu yükleniyor...</p>}

                <ul>
                  {dayObj.activities.map((act, idx) => (
                    <li key={idx} className="activity-item">
                      <strong>🎯 {act.name}</strong>{" "}
                      {act.category ? `(${act.category})` : ""} – <strong>{act.cost} ₺</strong>
                      <br />
                      📌 {act.destination} / {act.city}
                    </li>
                  ))}
                </ul>
              </div>
            );
          })}
        </>
      )}

      <button onClick={onBack} style={{ marginTop: "20px" }}>
        ← Back
      </button>
    </div>
  );
}

export default Results;
