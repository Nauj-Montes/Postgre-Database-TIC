import React, { useState, useEffect } from "react";
import { Layout, Typography, Alert, Row, Col, Button } from "antd";
import { PlusOutlined } from "@ant-design/icons";
import calendarService from "../services/calendarService";
import contactService from "../services/contactService";

import Calendar from "../components/Calendar";
import UpcomingEvents from "../components/UpcomingEvents";
import EventDrawer from "../components/EventDrawer";

const { Content } = Layout;
const { Title } = Typography;

const CalendarPage = () => {
  const [events, setEvents] = useState([]);
  const [contacts, setContacts] = useState([]);
  const [error, setError] = useState(null);
  const [drawerVisible, setDrawerVisible] = useState(false);
  const [isCreatingEvent, setIsCreatingEvent] = useState(false);
  const [selectedEvents, setSelectedEvents] = useState([]);

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

  useEffect(() => {
    fetchEventsAndContacts();

    if (localStorage.getItem("showPopup") === "true") {
      setDrawerVisible(true);
      localStorage.removeItem("showPopup");
    }
  }, []);

  const getListData = (value) => {
    return events.filter((event) => event.date === value);
  };

  const handleAddNewEvent = () => {
    setIsCreatingEvent(true);
    setDrawerVisible(true);
  };

  const handleAddEvent = (newEvent) => {
    setEvents([...events, { ...newEvent, id: events.length + 1 }]);
    setDrawerVisible(false);
    setIsCreatingEvent(false);
  };

  const handleEditEvent = (updatedEvent) => {
    setEvents(
      events.map((event) =>
        event.id === updatedEvent.id ? updatedEvent : event
      )
    );
    setDrawerVisible(false);
  };

  const handleDeleteEvent = (eventId) => {
    setDrawerVisible(false);
    setEvents(events.filter((event) => event.id !== eventId));
  };

  const handleDateSelect = (value) => {
    const listData = getListData(value);
    setSelectedEvents(listData);
    setIsCreatingEvent(false);
    setDrawerVisible(true);
  };

  return (
    <Content style={{ padding: "0 50px" }}>
      <Title level={2}>Calendar</Title>
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
          <Calendar
            events={events}
            contacts={contacts}
            onDateSelect={handleDateSelect}
          />
        </Col>
      </Row>
      <EventDrawer
        visible={drawerVisible}
        onClose={() => setDrawerVisible(false)}
        events={events}
        contacts={contacts}
        onAddEvent={handleAddEvent}
        isCreatingEvent={isCreatingEvent}
      />
    </Content>
  );
};

export default CalendarPage;
