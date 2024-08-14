import React, { useState, useEffect } from "react";
import { Layout, Typography, Alert } from "antd";
import ContactHeader from "../components/ContactHeader";
import ContactList from "../components/ContactList";
import ContactGrid from "../components/ContactGrid";
import ContactDrawer from "../components/ContactDrawer"; // Import ContactDrawer
import contactService from "../services/contactService";
import "../styles/ContactPage.css";
import PlaceholderList from "../components/PlaceholderList";
import PlaceholderGrid from "../components/PlaceholderGrid.js";

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

  const handleSaveContact = async (updatedContact) => {
    try {
      if (selectedContact) {
        // Update the contact in the state and close the drawer
        await contactService.updateContact(selectedContact.id, updatedContact);
      } else {
        // Add the new contact to the state
        await contactService.createContact(updatedContact);
      }
      // Refresh contacts from the server
      const refreshedContacts = await contactService.getContacts();
      setContacts(refreshedContacts);
    } catch (error) {
      console.error("Failed to save contact:", error);
    }
    handleDrawerClose();
  };

  const handleAddNewContact = () => {
    setSelectedContact(null);
    setDrawerVisible(true);
  };

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
        <ContactHeader
          refreshContacts={() => contactService.getContacts().then(setContacts)}
          setViewMode={setViewMode}
          setSearchQuery={setSearchQuery}
          onAddNewContact={handleAddNewContact} // Pass the handler to ContactHeader
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
