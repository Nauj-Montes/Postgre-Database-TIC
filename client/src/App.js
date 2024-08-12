import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import ContactPage from "./pages/ContactPage";
/* import InteractionPage from './pages/InteractionPage';
import SalesPage from './pages/SalesPage';
import ReportPage from './pages/ReportPage'; */
import Navbar from "./components/Navbar";

function App() {
  return (
    <Router>
      <Navbar />
      <Routes>
        <Route path="/contacts" element={<ContactPage />} />
        {/*        <Route path="/interactions" element={<InteractionPage />} />
        <Route path="/sales" element={<SalesPage />} />
        <Route path="/reports" element={<ReportPage />} /> */}
      </Routes>
    </Router>
  );
}

export default App;
