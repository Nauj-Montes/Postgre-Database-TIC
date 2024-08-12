import React from "react";
import { Link } from "react-router-dom";

function Navbar() {
  return (
    <nav>
      <Link to="/contacts">Contacts</Link>
      <Link to="/interactions">Interactions</Link>
      <Link to="/sales">Sales</Link>
      <Link to="/reports">Reports</Link>
    </nav>
  );
}

export default Navbar;
