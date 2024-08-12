import React, { useState, useEffect } from "react";
import { Container, Box, Typography } from "@mui/material";
import ContactForm from "../components/ContactForm";
import ContactList from "../components/ContactList";
import contactService from "../services/contactService";
import LoadingSpinner from "../components/LoadingSpinner";
import ErrorAlert from "../components/ErrorAlert";
import "../styles/ContactPage.css"; // Import the CSS file

function ContactPage() {
  const [contacts, setContacts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

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

  if (loading) return <LoadingSpinner />;
  if (error) return <ErrorAlert message={error} />;

  return (
    <Container className="contact-page">
      <Box className="contact-form">
        <Typography variant="h4" gutterBottom>
          Contact Management
        </Typography>
        <ContactForm
          refreshContacts={() => contactService.getContacts().then(setContacts)}
        />
      </Box>
      <ContactList contacts={contacts} />
    </Container>
  );
}

export default ContactPage;
