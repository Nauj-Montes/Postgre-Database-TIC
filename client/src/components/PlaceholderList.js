import React from "react";
import "../styles/PlaceholderList.css";

function PlaceholderList() {
  const placeholders = Array.from({ length: 10 });

  return (
    <div className="placeholder-list">
      {placeholders.map((_, index) => (
        <div key={index} className="placeholder-item pulse"></div>
      ))}
    </div>
  );
}

export default PlaceholderList;
