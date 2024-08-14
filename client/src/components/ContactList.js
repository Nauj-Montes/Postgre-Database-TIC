import React from "react";
import { Table, Avatar, Button, Space, message } from "antd";
import { EditOutlined, DeleteOutlined, PhoneOutlined } from "@ant-design/icons";
import "../styles/ContactList.css";
import contactService from "../services/contactService"; // Import contactService

function ContactList({ contacts, onContactClick, refreshContacts }) {
  const handleDeleteContact = async (contactId) => {
    try {
      await contactService.deleteContact(contactId);
      message.success("Contact deleted!");
      refreshContacts(); // Refresh the contact list
    } catch (error) {
      message.error("Failed to delete contact.");
      console.error("Failed to delete contact:", error);
    }
  };

  const columns = [
    {
      title: "Name",
      key: "name",
      render: (text, record) => (
        <Space>
          <Avatar
            src={record.avatar}
            alt={`${record.firstName} ${record.lastName}`}
            className="contact-avatar"
          />
          <span>{`${record.firstName} ${record.lastName}`}</span>
        </Space>
      ),
      className: "contact-name",
    },
    {
      title: "Company",
      dataIndex: "companyName",
      key: "companyName",
      className: "contact-company",
    },
    {
      title: "Email",
      dataIndex: "email",
      key: "email",
      className: "contact-email",
    },
    {
      title: "Actions",
      key: "actions",
      render: (text, record) => (
        <Space size="middle">
          <Button
            icon={<EditOutlined />}
            onClick={() => onContactClick(record)}
            className="edit-button"
          />
          <Button
            icon={<PhoneOutlined />}
            className="phone-button"
            onClick={() => (window.location.href = `tel:${record.phoneNumber}`)}
          />
          <Button
            icon={<DeleteOutlined />}
            className="delete-button"
            onClick={() => handleDeleteContact(record.id)} // Call the delete handler
          />
        </Space>
      ),
      className: "contact-actions",
    },
  ];

  return (
    <Table
      dataSource={contacts}
      columns={columns}
      rowKey="id"
      className="contact-table"
    />
  );
}

export default ContactList;
