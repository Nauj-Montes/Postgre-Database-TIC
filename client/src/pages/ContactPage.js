import React, { useState, useEffect } from "react";
import { Layout, Typography, Spin, Alert } from "antd";
import ContactHeader from "../components/ContactHeader";
import ContactList from "../components/ContactList";
import ContactGrid from "../components/ContactGrid";
import ContactDrawer from "../components/ContactDrawer"; // Import ContactDrawer
import contactService from "../services/contactService";
import "../styles/ContactPage.css";

const { Content } = Layout;
const { Title } = Typography;

function ContactPage() {
  const [contacts, setContacts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [viewMode, setViewMode] = useState("table");
  const [searchQuery, setSearchQuery] = useState("");
  const [drawerVisible, setDrawerVisible] = useState(false);
  const [selectedContact, setSelectedContact] = useState(null);

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

  const handleContactClick = (contact) => {
    setSelectedContact(contact);
    setDrawerVisible(true);
  };

  const handleDrawerClose = () => {
    setDrawerVisible(false);
    setSelectedContact(null);
  };

  const handleSaveContact = (updatedContact) => {
    // Update the contact in the state and close the drawer
    setContacts((prevContacts) =>
      prevContacts.map((contact) =>
        contact.id === selectedContact.id
          ? { ...contact, ...updatedContact }
          : contact
      )
    );
    handleDrawerClose();
  };

  if (loading) return <Spin size="large" />;
  if (error)
    return <Alert message="Error" description={error} type="error" showIcon />;

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
          setViewMode={setViewMode}
          setSearchQuery={setSearchQuery}
        />
      </Content>
      <Content>
        {viewMode === "table" ? (
          <ContactList
            contacts={filteredContacts}
            onContactClick={handleContactClick}
          />
        ) : (
          <ContactGrid
            contacts={filteredContacts}
            onContactClick={handleContactClick}
          />
        )}
      </Content>
      <ContactDrawer
        visible={drawerVisible}
        onClose={handleDrawerClose}
        contact={selectedContact}
        onSave={handleSaveContact}
      />
    </Layout>
  );
}

export default ContactPage;
