import { useState } from "react";
import { createPlan } from "./api";// ✅ api.js burada

function Plan({ onPlanGenerated }) {
  const [budget, setBudget] = useState("");
  const [days, setDays] = useState("");
  const [interests, setInterests] = useState([]);
  const [loading, setLoading] = useState(false);

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
      interests, // DB seed'e göre: culture, nature...
    };

    setLoading(true);
    try {
      // ✅ ŞİMDİLİK MOCK (backend hazır değilken)
      const mockResponse = {
        summary: { budget: budgetNum, totalCost: 280 },
        plan: [
          {
            day: 1,
            destination: "Istanbul Center",
            activities: [{ name: "Galata Tower", category: "culture", cost: 200 }],
          },
          {
            day: 2,
            destination: "Ankara Center",
            activities: [
              {
                name: "Museum of Anatolian Civilizations",
                category: "culture",
                cost: 80,
              },
            ],
          },
        ],
      };

      onPlanGenerated(mockResponse);

      // ✅ BACKEND GELİNCE SADECE ŞU 2 SATIRI AÇACAKSIN:
      // const data = await createPlan(payload);
      // onPlanGenerated(data);
    } catch (err) {
      alert(err?.message || "Bir hata oluştu.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <h2>Trip Planner</h2>

      <div style={{ marginBottom: 10 }}>
        <label>Budget:</label>
        <input
          type="number"
          value={budget}
          onChange={(e) => setBudget(e.target.value)}
          min="1"
        />
      </div>

      <div style={{ marginBottom: 10 }}>
        <label>Days:</label>
        <input
          type="number"
          value={days}
          onChange={(e) => setDays(e.target.value)}
          min="1"
        />
      </div>

      <div style={{ marginBottom: 10 }}>
        <label>Interests:</label>
        <div>
          <label style={{ display: "block" }}>
            <input
              type="checkbox"
              checked={interests.includes("culture")}
              onChange={() => toggleInterest("culture")}
            />
            Culture
          </label>

          <label style={{ display: "block" }}>
            <input
              type="checkbox"
              checked={interests.includes("nature")}
              onChange={() => toggleInterest("nature")}
            />
            Nature
          </label>
        </div>
      </div>

      <button type="submit" disabled={loading}>
        {loading ? "Creating..." : "Create Plan"}
      </button>
    </form>
  );
}

export default Plan;
