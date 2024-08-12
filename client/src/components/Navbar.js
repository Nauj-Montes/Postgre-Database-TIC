import React from "react";
import { Link } from "react-router-dom";
import { AppBar, Toolbar, Button } from "@mui/material";
import "../styles/Navbar.css"; // Import the CSS file

function Navbar() {
  return (
    <AppBar position="static" className="navbar">
      <Toolbar>
        <Button
          color="inherit"
          component={Link}
          to="/contacts"
          className="nav-link"
        >
          Contacts
        </Button>
        <Button
          color="inherit"
          component={Link}
          to="/interactions"
          className="nav-link"
        >
          Interactions
        </Button>
        <Button
          color="inherit"
          component={Link}
          to="/sales"
          className="nav-link"
        >
          Sales
        </Button>
        <Button
          color="inherit"
          component={Link}
          to="/reports"
          className="nav-link"
        >
          Reports
        </Button>
      </Toolbar>
    </AppBar>
  );
}

export default Navbar;
