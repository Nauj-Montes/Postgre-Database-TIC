import React from "react";
import { Select, Card } from "antd";

const { Option } = Select;

const EventFilter = ({ onFilterChange }) => {
  return (
    <Card title="Filter Events" style={{ width: "30%" }}>
      <Select
        defaultValue="all"
        style={{ width: "100%" }}
        onChange={onFilterChange}
      >
        <Option value="all">All</Option>
        <Option value="email">Email</Option>
        <Option value="call">Call</Option>
        <Option value="deal">Deal</Option>
        <Option value="meeting">Meeting</Option>
        <Option value="other">Other</Option>
      </Select>
    </Card>
  );
};

export default EventFilter;
