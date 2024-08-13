import React from "react";
import { Card, List, Row, Col, Avatar } from "antd";
import {
  PhoneOutlined,
  HomeOutlined,
  BankOutlined,
  UserOutlined,
} from "@ant-design/icons";
import { format } from "date-fns";
import EventItem from "./EventItem";

const formatEventDate = (dateString) => {
  const options = {
    weekday: "long",
    day: "2-digit",
    hour: "2-digit",
    minute: "2-digit",
    hour12: true,
  };
  return new Date(dateString).toLocaleDateString("en-US", options);
};

const isThisWeek = (dateString) => {
  const now = new Date();
  const eventDate = new Date(dateString);
  const startOfWeek = new Date(now.setDate(now.getDate() - now.getDay()));
  const endOfWeek = new Date(now.setDate(now.getDate() - now.getDay() + 6));
  return eventDate >= startOfWeek && eventDate <= endOfWeek;
};

const UpcomingEvents = ({ events, contacts }) => {
  const eventsThisWeek = events.filter((event) => isThisWeek(event.date));

  const getContactInfo = (contactId) => {
    return contacts.find((contact) => contact.id === contactId) || {};
  };

  const formatDate = (dateString) => {
    const date = new Date(dateString);
    return format(date, "EEEE dd 'at' hh:mmaaa");
  };

  return (
    <Card
      title="This Week Events"
      style={{ marginBottom: 20, boxShadow: "0 0 10px rgba(0, 0, 0, 0.1)" }}
    >
      <List
        dataSource={eventsThisWeek}
        renderItem={(item) => {
          const contact = getContactInfo(item.contactId);
          return (
            <List.Item
              style={{
                padding: "16px",
                borderBottom: "1px solid #f0f0f0",
                display: "block",
              }}
            >
              <Row style={{ width: "100%" }}>
                <Col span={24}>
                  <List.Item.Meta
                    avatar={<Avatar src={contact.avatar} />}
                    title={
                      <span>
                        <UserOutlined style={{ marginRight: 8 }} />
                        {`${contact.firstName} ${contact.lastName}`}
                      </span>
                    }
                    description={
                      <>
                        <div>
                          <BankOutlined style={{ marginRight: 8 }} />
                          Company: {contact.companyName}
                        </div>
                        <div>
                          <HomeOutlined style={{ marginRight: 8 }} />
                          Industry: {contact.industry}
                        </div>
                        <div>
                          <PhoneOutlined style={{ marginRight: 8 }} />
                          Phone: {contact.phoneNumber}
                        </div>
                      </>
                    }
                  />
                </Col>
              </Row>
              <Row style={{ width: "100%", marginTop: 16 }}>
                <Col span={24}>
                  <EventItem event={item} />
                </Col>
              </Row>
              <Row style={{ width: "100%", marginTop: 8 }}>
                <Col span={24}>
                  <div style={{ fontStyle: "italic", color: "#888" }}>
                    {formatDate(item.date)}
                  </div>
                </Col>
              </Row>
            </List.Item>
          );
        }}
      />
    </Card>
  );
};

export default UpcomingEvents;
