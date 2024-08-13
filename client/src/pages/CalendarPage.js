import React, { useState, useEffect } from "react";
import { Layout, Typography, Alert, Row, Col, Button } from "antd";
import { PlusOutlined } from "@ant-design/icons";
import calendarService from "../services/calendarService";
import contactService from "../services/contactService";

import Calendar from "../components/Calendar";
import UpcomingEvents from "../components/UpcomingEvents";

const { Content } = Layout;
const { Title } = Typography;

const CalendarPage = () => {
  const [events, setEvents] = useState([]);
  const [contacts, setContacts] = useState([]);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchEventsAndContacts = async () => {
      try {
        const eventsData = await calendarService.getEvents();
        console.log("eventsData", eventsData);
        setEvents(eventsData);

        const contactsPromises = eventsData.map((event) =>
          contactService.getContactById(event.contactId)
        );
        const contactsData = await Promise.all(contactsPromises);
        console.log("contactsData", contactsData);
        setContacts(contactsData);
      } catch (error) {
        setError(error);
      }
    };

    fetchEventsAndContacts();
  }, []);

  const handleAddNewEvent = () => {
    // Implement the logic to add a new event
    console.log("Add New Event button clicked");
  };

  return (
    <Content style={{ padding: "0 50px" }}>
      <Title level={2}></Title>
      {error && <Alert message={error.message} type="error" />}
      <Row gutter={16}>
        <Col span={6}>
          <Button
            type="primary"
            onClick={handleAddNewEvent}
            style={{ marginBottom: 16, width: "100%" }}
            icon={<PlusOutlined />}
          >
            Add New Event
          </Button>
          <UpcomingEvents events={events} contacts={contacts} />
        </Col>
        <Col span={18}>
          <Calendar events={events} contacts={contacts} />
        </Col>
      </Row>
    </Content>
  );
};

export default CalendarPage;
