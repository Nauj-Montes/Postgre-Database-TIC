import React, { useState, useEffect } from "react";
import ContactForm from "../components/ContactForm";
import ContactList from "../components/ContactList";
import contactService from "../services/contactService";
import LoadingSpinner from "../components/LoadingSpinner";
import ErrorAlert from "../components/ErrorAlert";

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
    <div>
      <ContactForm
        refreshContacts={() => contactService.getContacts().then(setContacts)}
      />
      <ContactList contacts={contacts} />
    </div>
  );
}

export default ContactPage;
