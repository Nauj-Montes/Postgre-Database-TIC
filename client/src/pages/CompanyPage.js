import React, { useState, useEffect } from "react";
import { Layout, Typography, Alert, notification } from "antd";
import CompanyHeader from "../components/CompanyHeader";
import CompanyList from "../components/CompanyList";
import CompanyGrid from "../components/CompanyGrid";
import CompanyDrawer from "../components/CompanyDrawer";
import contactService from "../services/contactService";
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
      .getContacts()
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

  const handleAddNewCompany = () => {
    setSelectedCompany({
      id: "",
      phoneNumber: "",
      address: "",
      avatar: "",
      firstName: "",
      lastName: "",
      email: "",
      companyName: "",
      industry: "",
      companyLogo: "",
      companyDeals: "",
      companyRevenue: "",
      createdAt: "",
      updatedAt: "",
      salesOwner: "",
    });
    setDrawerVisible(true);
  };

  const handleDrawerClose = () => {
    setDrawerVisible(false);
    setSelectedCompany(null);
  };

  const handleSaveCompany = async (updatedCompany) => {
    try {
      if (selectedCompany.id) {
        await contactService.updateContact(selectedCompany.id, updatedCompany);
        notification.success({
          message: "Company Modified",
          description: `Company ${updatedCompany.companyName} has been successfully modified.`,
        });
      } else {
        await contactService.createContact(updatedCompany);
        notification.success({
          message: "Company Added",
          description: `Company ${updatedCompany.companyName} has been successfully added.`,
        });
      }
      setCompanies((prevCompanies) =>
        prevCompanies.map((company) =>
          company.id === selectedCompany.id
            ? { ...company, ...updatedCompany }
            : company
        )
      );
      handleDrawerClose();
    } catch (error) {
      notification.error({
        message: "Error",
        description: "There was an error saving the company.",
      });
    }
  };

  if (error)
    return <Alert message="Error" description={error} type="error" showIcon />;

  const filteredCompanies = companies
    .filter((company) => company.companyName !== null)
    .filter((company) =>
      company.companyName.toLowerCase().includes(searchQuery.toLowerCase())
    );

  return (
    <Layout className="company-page">
      <Content className="company-header">
        <CompanyHeader
          refreshCompanies={() =>
            contactService.getContacts().then(setCompanies)
          }
          setViewMode={setViewMode}
          setSearchQuery={setSearchQuery}
          onAddNewCompany={handleAddNewCompany}
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
      <CompanyDrawer
        visible={drawerVisible}
        onClose={handleDrawerClose}
        company={selectedCompany}
        onSave={handleSaveCompany}
      />
    </Layout>
  );
}

export default CompanyPage;
