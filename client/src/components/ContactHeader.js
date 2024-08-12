import React, { useState } from "react";
import { Input, Button, Space } from "antd";
import {
  PlusOutlined,
  SearchOutlined,
  TableOutlined,
  AppstoreOutlined,
} from "@ant-design/icons";
import styled from "styled-components";
import contactService from "../services/contactService";
import ErrorAlert from "./ErrorAlert";

// Create a styled component for ContactHeader
const StyledContactHeader = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-bottom: 30px;
  background-color: transparent;
  border-bottom: 1px solid #ddd;

  .ant-space {
    display: flex;
    gap: 16px;
  }

  .ant-btn {
    display: flex;
    align-items: center;
  }

  .ant-input {
    width: 200px;
  }
`;

function ContactHeader({ refreshContacts, setViewMode, setSearchQuery }) {
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
    <StyledContactHeader>
      <Button type="primary" icon={<PlusOutlined />} onClick={handleSubmit}>
        Add New Contact
      </Button>
      <Space>
        <Input
          placeholder="Search by name"
          prefix={<SearchOutlined />}
          onChange={(e) => setSearchQuery(e.target.value)} // Update search query
        />
        <Button icon={<TableOutlined />} onClick={() => setViewMode("table")} />
        <Button
          icon={<AppstoreOutlined />}
          onClick={() => setViewMode("grid")}
        />
      </Space>
      {error && <ErrorAlert message={error} />}
    </StyledContactHeader>
  );
}

export default ContactHeader;
