import React from "react";
import { Table, Avatar, Button, Space } from "antd";
import { EditOutlined, DeleteOutlined } from "@ant-design/icons";
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
        />
      ),
    },
    {
      title: "First Name",
      dataIndex: "firstName",
      key: "firstName",
    },
    {
      title: "Last Name",
      dataIndex: "lastName",
      key: "lastName",
    },
    {
      title: "Phone Number",
      dataIndex: "phoneNumber",
      key: "phoneNumber",
    },
    {
      title: "Address",
      dataIndex: "address",
      key: "address",
    },
    {
      title: "Email",
      dataIndex: "email",
      key: "email",
    },
    {
      title: "Actions",
      key: "actions",
      render: (text, record) => (
        <Space size="middle">
          <Button
            icon={<EditOutlined />}
            onClick={() => onContactClick(record)}
          />
          <Button icon={<DeleteOutlined />} />
        </Space>
      ),
    },
  ];

  return <Table dataSource={contacts} columns={columns} rowKey="id" />;
}

export default ContactList;
