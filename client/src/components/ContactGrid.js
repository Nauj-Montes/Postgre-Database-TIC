import React, { useState } from "react";
import { Card, Avatar, Pagination } from "antd";
import "../styles/ContactGrid.css";

const { Meta } = Card;

function ContactGrid({ contacts, onContactClick }) {
  const [currentPage, setCurrentPage] = useState(1);
  const contactsPerPage = 12;

  const indexOfLastContact = currentPage * contactsPerPage;
  const indexOfFirstContact = indexOfLastContact - contactsPerPage;
  const currentContacts = contacts.slice(
    indexOfFirstContact,
    indexOfLastContact
  );

  const handlePageChange = (page) => {
    setCurrentPage(page);
  };

  return (
    <div>
      <div className="contact-grid">
        {currentContacts.map((contact) => (
          <Card
            key={contact.id}
            hoverable
            cover={<Avatar src={contact.avatar} size={64} />}
            onClick={() => onContactClick(contact)}
          >
            <Meta
              title={`${contact.firstName} ${contact.lastName}`}
              description={
                <>
                  <p>{contact.companyName}</p>
                  <p>{contact.phoneNumber}</p>
                  <p>{contact.email}</p>
                  <p>{contact.address}</p>
                </>
              }
            />
          </Card>
        ))}
      </div>
      <div className="pagination-container">
        <Pagination
          current={currentPage}
          pageSize={contactsPerPage}
          total={contacts.length}
          onChange={handlePageChange}
        />
      </div>
    </div>
  );
}

export default ContactGrid;
