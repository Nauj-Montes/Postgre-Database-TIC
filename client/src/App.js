import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import { Layout } from "antd";
import ContactPage from "./pages/ContactPage";
/* import InteractionPage from './pages/InteractionPage';
import SalesPage from './pages/SalesPage';
import ReportPage from './pages/ReportPage'; */
import Navbar from "./components/Navbar";

const { Header, Footer, Sider, Content } = Layout;

function App() {
  return (
    <Router>
      <Layout>
        <Header>header</Header>
        <Layout>
          <Sider>
            <Navbar />
          </Sider>
          <Content>
            <Routes>
              <Route path="/contacts" element={<ContactPage />} />
              {/* <Route path="/interactions" element={<InteractionPage />} />
              <Route path="/sales" element={<SalesPage />} />
              <Route path="/reports" element={<ReportPage />} /> */}
            </Routes>
          </Content>
        </Layout>
        <Footer>footer</Footer>
      </Layout>
    </Router>
  );
}

export default App;
