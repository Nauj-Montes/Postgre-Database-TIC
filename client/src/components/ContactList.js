import React from "react";
import { Table, Avatar, Button, Space } from "antd";
import { EditOutlined, DeleteOutlined, PhoneOutlined } from "@ant-design/icons";
import "../styles/ContactList.css";

function ContactList({ contacts, onContactClick }) {
  const columns = [
    {
      title: "Avatar",
      dataIndex: "avatar",
      key: "avatar",
      render: (text, record) => (
        <Avatar
          src={record.avatar}
          alt={`${record.firstName} ${record.lastName}`}
          className="contact-avatar"
        />
      ),
    },
    {
      title: "First Name",
      dataIndex: "firstName",
      key: "firstName",
      className: "contact-first-name",
    },
    {
      title: "Last Name",
      dataIndex: "lastName",
      key: "lastName",
      className: "contact-last-name",
    },
    {
      title: "Phone Number",
      dataIndex: "phoneNumber",
      key: "phoneNumber",
      className: "contact-phone-number",
    },
    {
      title: "Address",
      dataIndex: "address",
      key: "address",
      className: "contact-address",
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
          <Button icon={<DeleteOutlined />} className="delete-button" />
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
