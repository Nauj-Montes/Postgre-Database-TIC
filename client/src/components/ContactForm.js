import React, { useState } from "react";
import contactService from "../services/contactService";
import ErrorAlert from "./ErrorAlert";

function ContactForm({ refreshContacts }) {
  const [contact, setContact] = useState({
    firstName: "",
    lastName: "",
    email: "",
    phoneNumber: "",
    address: "",
  });
  const [error, setError] = useState(null);

  const handleChange = (e) =>
    setContact({ ...contact, [e.target.name]: e.target.value });

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await contactService.createContact(contact);
      refreshContacts();
    } catch (err) {
      setError(err.message);
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      {/* Form fields and submit button */}
      {error && <ErrorAlert message={error} />}
    </form>
  );
}

export default ContactForm;
