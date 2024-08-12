import React from "react";
import "../styles/PlaceholderGrid.css";

function PlaceholderGrid() {
  const placeholders = Array.from({ length: 12 });

  return (
    <div className="placeholder-grid">
      {placeholders.map((_, index) => (
        <div key={index} className="placeholder-card pulse"></div>
      ))}
    </div>
  );
}

export default PlaceholderGrid;
