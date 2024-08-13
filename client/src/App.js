import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import { Layout } from "antd";
import DashboardPage from "./pages/DashboardPage";
import ContactPage from "./pages/ContactPage";
import CompanyPage from "./pages/CompanyPage";
import CalendarPage from "./pages/CalendarPage";
import Navbar from "./components/Navbar";
import nikeLogo from "./assets/nike-11.png"; // Import the Nike logo

const { Header, Footer, Sider, Content } = Layout;

function App() {
  return (
    <Router>
      <Layout
        style={{ minHeight: "100vh", display: "flex", flexDirection: "column" }}
      >
        <Header
          style={{
            display: "flex",
            alignItems: "center",
            backgroundColor: "white",
          }}
        >
          <img
            src={nikeLogo}
            alt="Nike Logo"
            style={{ height: "40px", marginRight: "10px" }}
          />
        </Header>
        <Layout style={{ flex: 1, display: "flex" }}>
          <Sider>
            <Navbar />
          </Sider>
          <Content>
            <Routes>
              <Route path="/" element={<DashboardPage />} />
              <Route path="/contacts" element={<ContactPage />} />
              <Route path="/companies" element={<CompanyPage />} />
              <Route path="/calendar" element={<CalendarPage />} />
            </Routes>
          </Content>
        </Layout>
        <Footer
          style={{
            textAlign: "center",
            backgroundColor: "white",
            color: "#001529",
            padding: "20px 50px",
            fontSize: "16px",
            borderTop: "1px solid #e8e8e8",
            boxShadow: "0px 0px 10px 0px rgba(0,0,0,0.1)",
          }}
        >
          ©2024 Created by Juan Montes, Manuel de León, Alexis Este, and
          Verónica Chacóns
        </Footer>
      </Layout>
    </Router>
  );
}

export default App;
