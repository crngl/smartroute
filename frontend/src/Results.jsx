function Results({ data, onBack }) {
  return (
    <div>
      <h2>Trip Plan</h2>

      <p>
        Budget: {data.summary.budget} ₺ | Total Cost:{" "}
        {data.summary.totalCost} ₺
      </p>

      {data.plan.map((day) => (
        <div key={day.day}>
          <h3>Day {day.day}</h3>
          <strong>{day.destination}</strong>

          <ul>
            {day.activities.map((act, index) => (
              <li key={index}>
                {act.name} ({act.category}) – {act.cost} ₺
              </li>
            ))}
          </ul>
        </div>
      ))}

      <button onClick={onBack}>Back</button>
    </div>
  );
}

export default Results;
