import React, { useState } from "react";
import {
  Drawer,
  Form,
  Select,
  DatePicker,
  Input,
  Button,
  List,
  Row,
  Col,
  Avatar,
  message,
} from "antd";
import {
  UserOutlined,
  BankOutlined,
  HomeOutlined,
  PhoneOutlined,
} from "@ant-design/icons";
import { format } from "date-fns"; // Import format from date-fns
import moment from "moment"; // Import moment for date manipulation
import calendarService from "../services/calendarService";
import EventItem from "./EventItem"; // Import EventItem component

const { Option } = Select;

const EventDrawer = ({
  visible,
  onClose,
  events,
  contacts,
  onAddEvent,
  isCreatingEvent,
}) => {
  const [newEvent, setNewEvent] = useState({
    contactId: null,
    type: "email",
    date: null,
    notes: "",
  });

  const [editingEvent, setEditingEvent] = useState(null);

  const getContactInfo = (contactId) => {
    return contacts.find((contact) => contact.id === contactId) || {};
  };

  const formatDate = (dateString) => {
    const date = new Date(dateString);
    return format(date, "EEEE dd 'at' hh:mmaaa");
  };

  const handleInputChange = (field, value) => {
    if (field === "date") {
      value = value ? moment(value) : null; // Convert to moment object
    }
    if (editingEvent) {
      setEditingEvent({ ...editingEvent, [field]: value });
    } else {
      setNewEvent({ ...newEvent, [field]: value });
    }
  };

  const handleAddEvent = () => {
    const formattedEvent = {
      ...newEvent,
      date: newEvent.date ? newEvent.date.toISOString() : null,
    };
    calendarService
      .createEvent(formattedEvent)
      .then(() => {
        message.success("Event added successfully");
        onAddEvent(formattedEvent);
      })
      .catch((error) => {
        message.error("Failed to add event");
      });
  };

  const handleEditEvent = (event) => {
    setEditingEvent(event);
  };

  const handleSaveEditEvent = () => {
    const formattedEvent = {
      ...editingEvent,
      date: editingEvent.date ? moment(editingEvent.date).toISOString() : null, // Convert to ISO string
    };
    calendarService
      .updateEvent(formattedEvent.id, formattedEvent)
      .then(() => {
        message.success("Event updated successfully");
        onAddEvent(formattedEvent);
        setEditingEvent(null);
        window.location.reload();
      })
      .catch((error) => {
        console.error("Failed to update event", error);
      });
  };

  const handleDeleteEvent = (eventId) => {
    calendarService
      .deleteEvent(eventId)
      .then(() => {
        message.success("Event deleted successfully");
        window.location.reload();
      })
      .catch((error) => {
        console.error("Failed to delete event", error);
      });
  };

  return (
    <Drawer
      title="Events"
      placement="right"
      onClose={onClose}
      open={visible}
      bodyStyle={{ padding: 0 }}
    >
      {isCreatingEvent || editingEvent ? (
        <Form layout="vertical" style={{ padding: 16 }}>
          <Form.Item label="Contact">
            <Select
              showSearch
              placeholder="Select a contact"
              value={editingEvent ? editingEvent.contactId : newEvent.contactId}
              onChange={(value) => handleInputChange("contactId", value)}
              disabled={!!editingEvent}
              optionLabelProp="label"
            >
              {contacts.map((contact) => (
                <Option
                  key={contact.id}
                  value={contact.id}
                  label={`${contact.firstName} ${contact.lastName}`}
                >
                  <div style={{ display: "flex", alignItems: "center" }}>
                    <Avatar src={contact.avatar} style={{ marginRight: 8 }} />
                    {`${contact.firstName} ${contact.lastName}`}
                  </div>
                </Option>
              ))}
            </Select>
          </Form.Item>
          <Form.Item label="Type">
            <Select
              value={editingEvent ? editingEvent.type : newEvent.type}
              onChange={(value) => handleInputChange("type", value)}
            >
              <Option value="email">Email</Option>
              <Option value="call">Call</Option>
              <Option value="deal">Deal</Option>
              <Option value="meeting">Meeting</Option>
              <Option value="other">Other</Option>
            </Select>
          </Form.Item>
          <Form.Item label="Date">
            <DatePicker
              showTime
              value={editingEvent ? moment(editingEvent.date) : newEvent.date}
              onChange={(date) => handleInputChange("date", date)}
            />
          </Form.Item>
          <Form.Item label="Notes">
            <Input.TextArea
              value={editingEvent ? editingEvent.notes : newEvent.notes}
              onChange={(e) => handleInputChange("notes", e.target.value)}
              disabled={!!editingEvent}
            />
          </Form.Item>
          <Button
            type="primary"
            onClick={editingEvent ? handleSaveEditEvent : handleAddEvent}
          >
            {editingEvent ? "Save Changes" : "Add Event"}
          </Button>
        </Form>
      ) : (
        <List
          dataSource={events}
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
                <Row style={{ width: "100%", marginTop: 8 }}>
                  <Col span={12}>
                    <Button
                      type="primary"
                      onClick={() => handleEditEvent(item)}
                    >
                      Edit
                    </Button>
                  </Col>
                  <Col span={12}>
                    <Button
                      type="danger"
                      onClick={() => handleDeleteEvent(item.id)}
                    >
                      Delete
                    </Button>
                  </Col>
                </Row>
              </List.Item>
            );
          }}
        />
      )}
    </Drawer>
  );
};

export default EventDrawer;
