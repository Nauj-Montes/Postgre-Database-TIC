import React from "react";
import { Table, Avatar, Button, Space } from "antd";
import {
  EditOutlined,
  DeleteOutlined,
  DollarOutlined,
  UserOutlined,
  ShopOutlined,
} from "@ant-design/icons";
import "../styles/CompanyList.css";

function CompanyList({ companies, onCompanyClick }) {
  const formatRevenue = (revenue) => {
    return new Intl.NumberFormat("en-US", {
      style: "currency",
      currency: "USD",
    }).format(revenue);
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
          <Button icon={<DeleteOutlined />} className="delete-button" />
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
