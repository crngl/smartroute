import { useState } from "react";
import { createPlan } from "./api";

function Plan({ onPlanGenerated }) {
  const [budget, setBudget] = useState("");
  const [days, setDays] = useState("");
  const [interests, setInterests] = useState([]);
  const [loading, setLoading] = useState(false);

  const interestOptions = [
    { value: "culture", label: "🏛️ Culture" },
    { value: "nature", label: "🌿 Nature" },
    { value: "food", label: "🍽️ Food" },
    { value: "adventure", label: "🏔️ Adventure" },
    { value: "history", label: "🏺 History" },
    { value: "beach", label: "🏖️ Beach" },
  ];

  const toggleInterest = (value) => {
    setInterests((prev) =>
      prev.includes(value) ? prev.filter((i) => i !== value) : [...prev, value]
    );
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    const budgetNum = Number(budget);
    const daysNum = Number(days);

    if (!budgetNum || budgetNum <= 0 || !daysNum || daysNum <= 0) {
      alert("Budget ve Days pozitif sayı olmalı.");
      return;
    }

    if (interests.length === 0) {
      alert("En az 1 ilgi alanı seç.");
      return;
    }

    const payload = {
      budget: budgetNum,
      days: daysNum,
      interests,
    };

    setLoading(true);
    try {
      const data = await createPlan(payload);
      onPlanGenerated(data);
    } catch (err) {
      alert(err?.message || "Plan oluşturulamadı.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="plan-form">
      <h2>🗺️ Trip Planner</h2>

      <div style={{ marginBottom: 20 }}>
        <label>💰 Budget (₺):</label>
        <input
          type="number"
          value={budget}
          onChange={(e) => setBudget(e.target.value)}
          min="1"
          placeholder="500"
          style={{
            width: "100%",
            padding: "8px",
            fontSize: "16px",
            borderRadius: "5px",
            border: "1px solid #ccc",
            boxSizing: "border-box",
          }}
        />
      </div>

      <div style={{ marginBottom: 20 }}>
        <label>📅 Days:</label>
        <input
          type="number"
          value={days}
          onChange={(e) => setDays(e.target.value)}
          min="1"
          max="30"
          placeholder="3"
          style={{
            width: "100%",
            padding: "8px",
            fontSize: "16px",
            borderRadius: "5px",
            border: "1px solid #ccc",
            boxSizing: "border-box",
          }}
        />
      </div>

      <div style={{ marginBottom: 20 }}>
        <label>❤️ Interests:</label>
        <div className="checkbox-group">
          {interestOptions.map((option) => (
            <label key={option.value} style={{ display: "block", marginBottom: "8px" }}>
              <input
                type="checkbox"
                checked={interests.includes(option.value)}
                onChange={() => toggleInterest(option.value)}
              />
              {option.label}
            </label>
          ))}
        </div>
      </div>

      <button
        type="submit"
        disabled={loading}
        style={{
          width: "100%",
          padding: "12px",
          fontSize: "16px",
          fontWeight: "bold",
          backgroundColor: loading ? "#ccc" : "#007bff",
          color: "white",
          border: "none",
          borderRadius: "5px",
          cursor: loading ? "not-allowed" : "pointer",
        }}
      >
        {loading ? "⏳ Creating..." : "🚀 Create Plan"}
      </button>
    </form>
  );
}

export default Plan;
