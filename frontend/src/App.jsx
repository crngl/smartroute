import { useState } from "react";
import Plan from "./Plan";
import Results from "./Results";
import "./App.css";


function App() {
  const [planResult, setPlanResult] = useState(null);

  return (
    <div style={{ padding: "20px" }}>
      {!planResult ? (
        <Plan onPlanGenerated={setPlanResult} />
      ) : (
        <Results data={planResult} onBack={() => setPlanResult(null)} />
      )}
    </div>
  );
}

export default App;
