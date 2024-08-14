import React from "react";
import { Table, Avatar, Button, Space, notification } from "antd";
import {
  EditOutlined,
  DeleteOutlined,
  DollarOutlined,
  UserOutlined,
  ShopOutlined,
} from "@ant-design/icons";
import ContactService from "../services/contactService"; // Import the service to make API calls
import "../styles/CompanyList.css";

function CompanyList({ companies, onCompanyClick, refreshCompanies }) {
  const formatRevenue = (revenue) => {
    return new Intl.NumberFormat("en-US", {
      style: "currency",
      currency: "USD",
    }).format(revenue);
  };

  const handleDelete = async (record) => {
    try {
      // Create a copy of company data and set specified properties to null
      const updatedCompanyData = {
        ...record,
        companyName: null,
        industry: null,
        companyRevenue: null,
        companyDeals: null,
      };

      // Make the request to update the company data
      await ContactService.updateContact(record.id, updatedCompanyData);

      notification.success({
        message: "Company Deleted",
        description: `Company ${record.companyName} has been successfully deleted.`,
      });

      // Refresh the list of companies
      refreshCompanies();
    } catch (error) {
      console.error("Failed to update company:", error);
      notification.error({
        message: "Error",
        description: "There was an error deleting the company.",
      });
    }
  };

  const columns = [
    {
      title: "Company Name",
      key: "companyName",
      render: (text, record) => (
        <Space>
          <Avatar
            src={record.companyLogo}
            alt={record.companyName}
            className="company-logo"
          />
          <span>{record.companyName}</span>
        </Space>
      ),
      className: "company-name",
    },
    {
      title: "Sales Owner",
      key: "salesOwner",
      render: (text, record) => (
        <Space>
          <Avatar
            src={record.avatar}
            alt={`${record.firstName} ${record.lastName}`}
            className="sales-owner-avatar"
          />
          <span>{`${record.firstName} ${record.lastName}`}</span>
        </Space>
      ),
      className: "sales-owner",
    },
    {
      title: "Revenue",
      key: "companyRevenue",
      render: (text, record) => (
        <Space>
          <DollarOutlined />
          <span>{formatRevenue(record.companyRevenue)}</span>
        </Space>
      ),
      className: "company-revenue",
    },
    {
      title: "Industry",
      key: "industry",
      render: (text, record) => (
        <Space>
          <ShopOutlined />
          <span>{record.industry}</span>
        </Space>
      ),
      className: "company-industry",
    },
    {
      title: "Actions",
      key: "actions",
      render: (text, record) => (
        <Space size="middle">
          <Button
            icon={<EditOutlined />}
            onClick={() => onCompanyClick(record)}
            className="edit-button"
          />
          <Button
            icon={<DeleteOutlined />}
            className="delete-button"
            onClick={() => handleDelete(record)}
          />
        </Space>
      ),
      className: "company-actions",
    },
  ];

  return (
    <Table
      dataSource={companies}
      columns={columns}
      rowKey="id"
      className="company-table"
    />
  );
}

export default CompanyList;
