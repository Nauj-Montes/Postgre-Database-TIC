import React, { useState, useEffect } from "react";
import { Row, Col, Card, Statistic, Button, List, Avatar } from "antd";
import { useNavigate } from "react-router-dom";
import { Pie, Bar } from "@ant-design/charts";
import {
  UserOutlined,
  TeamOutlined,
  CalendarOutlined,
} from "@ant-design/icons";
import contactService from "../services/contactService";
import calendarService from "../services/calendarService";
import UpcomingEvents from "../components/UpcomingEvents";
import "../styles/DashboardPage.css"; // Import the CSS file

const Dashboard = () => {
  const [contacts, setContacts] = useState([]);
  const [events, setEvents] = useState([]);
  const navigate = useNavigate();

  useEffect(() => {
    const fetchData = async () => {
      const contactsData = await contactService.getContacts();
      setContacts(contactsData);

      const eventsData = await calendarService.getEvents();
      setEvents(eventsData);
    };

    fetchData();
  }, []);

  const handleViewAllContacts = () => {
    navigate("/contacts");
  };

  const handleViewAllCompanies = () => {
    navigate("/companies");
  };

  const uniqueCompanies = Array.from(
    new Set(contacts.map((contact) => contact.companyName))
  ).map((companyName) =>
    contacts.find((contact) => contact.companyName === companyName)
  );

  // Data for charts
  const industryData = contacts
    .filter((contact) => contact.industry !== null) // Filter out null industries
    .map((contact) => ({
      type: contact.industry,
      value: 1,
    }));

  const dealsData = contacts.map((contact) => ({
    company: contact.companyName,
    deals: contact.companyDeals,
  }));

  return (
    <div style={{ padding: "20px" }}>
      <Row gutter={16}>
        <Col span={8}>
          <Card className="fixed-height-card animated-card">
            <Statistic
              title={
                <span>
                  <UserOutlined /> Number of Contacts
                </span>
              }
              value={contacts.length}
            />
            <List
              itemLayout="horizontal"
              dataSource={contacts.slice(0, 3)}
              renderItem={(contact) => (
                <List.Item>
                  <List.Item.Meta
                    avatar={<Avatar src={contact.avatar} />}
                    title={`${contact.firstName} ${contact.lastName}`}
                    description={contact.email}
                  />
                </List.Item>
              )}
            />
            <Button type="link" onClick={handleViewAllContacts}>
              View All
            </Button>
          </Card>
        </Col>
        <Col span={8}>
          <Card className="fixed-height-card animated-card">
            <Statistic
              title={
                <span>
                  <TeamOutlined /> Number of Companies
                </span>
              }
              value={uniqueCompanies.length}
            />
            <List
              itemLayout="horizontal"
              dataSource={uniqueCompanies.slice(0, 3)}
              renderItem={(company) => (
                <List.Item>
                  <List.Item.Meta
                    avatar={<Avatar src={company.companyLogo} />}
                    title={company.companyName}
                    description={company.industry}
                  />
                </List.Item>
              )}
            />
            <Button type="link" onClick={handleViewAllCompanies}>
              View All
            </Button>
          </Card>
        </Col>
        <Col span={8}>
          <Card className="fixed-height-card overflow-card animated-card">
            <Statistic
              title={
                <span>
                  <CalendarOutlined /> Upcoming Events
                </span>
              }
              value={events.length}
            />
            <UpcomingEvents events={events} contacts={contacts} />
          </Card>
        </Col>
      </Row>
      <Row gutter={16} style={{ marginTop: "20px" }}>
        <Col span={12}>
          <Card title="Contacts by Industry" className="animated-card">
            <Pie data={industryData} angleField="value" colorField="type" />
          </Card>
        </Col>
        <Col span={12}>
          <Card title="Deals per Company" className="animated-card">
            <Bar data={dealsData} xField="company" yField="deals" />
          </Card>
        </Col>
      </Row>
    </div>
  );
};

export default Dashboard;
