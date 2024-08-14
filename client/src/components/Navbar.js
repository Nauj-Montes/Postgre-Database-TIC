import React from "react";
import { Link } from "react-router-dom";
import { Layout, Menu } from "antd";
import {
  DashboardOutlined,
  CalendarOutlined,
  ContactsOutlined,
  BuildOutlined,
  SettingOutlined,
} from "@ant-design/icons";
import "../styles/Navbar.css"; // Import the CSS file

const { Sider } = Layout;

function Navbar() {
  return (
    <Sider className="ant-sider-navbar">
      <Menu className="ochinchi">
        <Menu.Item key="1">
          <Link to="/" className="ant-nav-link">
            <DashboardOutlined />
            Dashboard
          </Link>
        </Menu.Item>
        <Menu.Item key="2">
          <Link to="/calendar" className="ant-nav-link">
            <CalendarOutlined />
            Calendar
          </Link>
        </Menu.Item>
        <Menu.Item key="3">
          <Link to="/companies" className="ant-nav-link">
            <BuildOutlined />
            Companies
          </Link>
        </Menu.Item>
        <Menu.Item key="4">
          <Link to="/contacts" className="ant-nav-link">
            <ContactsOutlined />
            Contacts
          </Link>
        </Menu.Item>
      </Menu>
    </Sider>
  );
}

export default Navbar;
