import React, { useState, useEffect } from "react";
import { Layout, Typography, Spin, Alert } from "antd";
import ContactHeader from "../components/ContactHeader";
import ContactList from "../components/ContactList";
import ContactGrid from "../components/ContactGrid"; // Import ContactGrid
import contactService from "../services/contactService";
import "../styles/ContactPage.css"; // Import the CSS file

const { Content } = Layout;
const { Title } = Typography;

function ContactPage() {
  const [contacts, setContacts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [viewMode, setViewMode] = useState("table"); // Add viewMode state
  const [searchQuery, setSearchQuery] = useState(""); // Add searchQuery state

  useEffect(() => {
    contactService
      .getContacts()
      .then((data) => {
        setContacts(data);
        setLoading(false);
      })
      .catch((err) => {
        setError(err.message);
        setLoading(false);
      });
  }, []);

  if (loading) return <Spin size="large" />;
  if (error)
    return <Alert message="Error" description={error} type="error" showIcon />;

  // Filter contacts based on search query
  const filteredContacts = contacts.filter((contact) =>
    `${contact.firstName} ${contact.lastName}`
      .toLowerCase()
      .includes(searchQuery.toLowerCase())
  );

  return (
    <Layout className="contact-page">
      <Content className="contact-header">
        <Title level={2} gutterBottom>
          Contact Management
        </Title>
        <ContactHeader
          refreshContacts={() => contactService.getContacts().then(setContacts)}
          setViewMode={setViewMode} // Pass setViewMode to ContactHeader
          setSearchQuery={setSearchQuery} // Pass setSearchQuery to ContactHeader
        />
      </Content>
      <Content>
        {viewMode === "table" ? (
          <ContactList contacts={filteredContacts} />
        ) : (
          <ContactGrid contacts={filteredContacts} /> // Use ContactGrid component
        )}
      </Content>
    </Layout>
  );
}

export default ContactPage;
