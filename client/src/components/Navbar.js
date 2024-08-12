import React from "react";
import { Link } from "react-router-dom";
import { Layout, Menu } from "antd";
import "../styles/Navbar.css"; // Import the CSS file

const { Sider } = Layout;

function Navbar() {
  return (
    <Sider className="ant-sider-navbar">
      <Menu className="ochinchi">
        <Menu.Item key="1">
          <Link to="/contacts" className="ant-nav-link">
            Contacts
          </Link>
        </Menu.Item>
        <Menu.Item key="2">
          <Link to="/interactions" className="ant-nav-link">
            Interactions
          </Link>
        </Menu.Item>
        <Menu.Item key="3">
          <Link to="/sales" className="ant-nav-link">
            Sales
          </Link>
        </Menu.Item>
        <Menu.Item key="4">
          <Link to="/reports" className="ant-nav-link">
            Reports
          </Link>
        </Menu.Item>
      </Menu>
    </Sider>
  );
}

export default Navbar;
