const API_URL = "http://localhost:3000";

export async function createPlan(payload) {
  const res = await fetch(`${API_URL}/create-plan`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(payload),
  });

  if (!res.ok) {
    throw new Error("Plan oluşturulamadı");
  }

  return res.json();
}
