import React, { useState } from "react";
import { Card, Avatar, Pagination } from "antd";
import "../styles/ContactGrid.css"; // Import the CSS file

const { Meta } = Card;

function ContactGrid({ contacts }) {
  const [currentPage, setCurrentPage] = useState(1);
  const contactsPerPage = 12;

  // Calculate the contacts to display on the current page
  const indexOfLastContact = currentPage * contactsPerPage;
  const indexOfFirstContact = indexOfLastContact - contactsPerPage;
  const currentContacts = contacts.slice(
    indexOfFirstContact,
    indexOfLastContact
  );

  // Handle page change
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
            style={{ width: 240 }}
            cover={<Avatar src={contact.avatar} size={64} />}
          >
            <Meta
              title={`${contact.firstName} ${contact.lastName}`}
              description={
                <>
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
