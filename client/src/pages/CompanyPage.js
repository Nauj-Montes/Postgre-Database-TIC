import React, { useState, useEffect } from "react";
import { Layout, Typography, Alert } from "antd";
import CompanyHeader from "../components/CompanyHeader";
import CompanyList from "../components/CompanyList";
import CompanyGrid from "../components/CompanyGrid";
/* import CompanyDrawer from "../components/CompanyDrawer"; */
import contactService from "../services/contactService"; // Updated import
import "../styles/CompanyPage.css";
import PlaceholderList from "../components/PlaceholderList";
import PlaceholderGrid from "../components/PlaceholderGrid.js";

const { Content } = Layout;
const { Title } = Typography;

function CompanyPage() {
  const [companies, setCompanies] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [viewMode, setViewMode] = useState("table");
  const [searchQuery, setSearchQuery] = useState("");
  const [drawerVisible, setDrawerVisible] = useState(false);
  const [selectedCompany, setSelectedCompany] = useState(null);

  useEffect(() => {
    contactService
      .getContacts() // Updated service call
      .then((data) => {
        setCompanies(data);
        setLoading(false);
      })
      .catch((err) => {
        setError(err.message);
        setLoading(false);
      });
  }, []);

  const handleCompanyClick = (company) => {
    setSelectedCompany(company);
    setDrawerVisible(true);
  };

  const handleDrawerClose = () => {
    setDrawerVisible(false);
    setSelectedCompany(null);
  };

  const handleSaveCompany = (updatedCompany) => {
    // Update the company in the state and close the drawer
    setCompanies((prevCompanies) =>
      prevCompanies.map((company) =>
        company.id === selectedCompany.id
          ? { ...company, ...updatedCompany }
          : company
      )
    );
    handleDrawerClose();
  };

  if (error)
    return <Alert message="Error" description={error} type="error" showIcon />;

  const filteredCompanies = companies.filter((company) =>
    company.companyName.toLowerCase().includes(searchQuery.toLowerCase())
  );

  return (
    <Layout className="company-page">
      <Content className="company-header">
        <CompanyHeader
          refreshCompanies={() =>
            contactService.getContacts().then(setCompanies)
          } // Updated service call
          setViewMode={setViewMode}
          setSearchQuery={setSearchQuery}
        />
      </Content>
      <Content>
        {loading ? (
          viewMode === "table" ? (
            <PlaceholderList />
          ) : (
            <PlaceholderGrid />
          )
        ) : viewMode === "table" ? (
          <CompanyList
            companies={filteredCompanies}
            onCompanyClick={handleCompanyClick}
          />
        ) : (
          <CompanyGrid
            companies={filteredCompanies}
            onCompanyClick={handleCompanyClick}
          />
        )}
      </Content>
      {/* <CompanyDrawer
        visible={drawerVisible}
        onClose={handleDrawerClose}
        company={selectedCompany}
        onSave={handleSaveCompany}
      /> */}
    </Layout>
  );
}

export default CompanyPage;
