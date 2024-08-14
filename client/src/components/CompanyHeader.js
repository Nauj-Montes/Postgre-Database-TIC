import React, { useState } from "react";
import { Input, Button, Space } from "antd";
import {
  PlusOutlined,
  SearchOutlined,
  TableOutlined,
  AppstoreOutlined,
} from "@ant-design/icons";
import styled from "styled-components";
import contactService from "../services/contactService"; // Updated import
import ErrorAlert from "./ErrorAlert";

const StyledCompanyHeader = styled.div`
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

function CompanyHeader({
  refreshCompanies,
  setViewMode,
  setSearchQuery,
  onAddNewCompany,
}) {
  const [company, setCompany] = useState({
    name: "",
    industry: "",
    revenue: "",
  });
  const [error, setError] = useState(null);

  const handleChange = (e) =>
    setCompany({ ...company, [e.target.name]: e.target.value });

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await contactService.createContact(company); // Updated service call
      refreshCompanies();
    } catch (err) {
      setError(err.message);
    }
  };

  return (
    <StyledCompanyHeader>
      <Button type="primary" icon={<PlusOutlined />} onClick={onAddNewCompany}>
        Add New Company
      </Button>
      <Space>
        <Input
          placeholder="Search by name"
          prefix={<SearchOutlined />}
          onChange={(e) => setSearchQuery(e.target.value)}
        />
        <Button icon={<TableOutlined />} onClick={() => setViewMode("table")} />
        <Button
          icon={<AppstoreOutlined />}
          onClick={() => setViewMode("grid")}
        />
      </Space>
      {error && <ErrorAlert message={error} />}
    </StyledCompanyHeader>
  );
}

export default CompanyHeader;
