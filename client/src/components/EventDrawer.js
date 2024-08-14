import React, { useState } from "react";
import {
  Drawer,
  List,
  Row,
  Col,
  Avatar,
  Button,
  Input,
  Select,
  DatePicker,
  Form,
  message,
} from "antd";
import {
  PhoneOutlined,
  HomeOutlined,
  BankOutlined,
  UserOutlined,
} from "@ant-design/icons";
import { format } from "date-fns";
import EventItem from "./EventItem";
import calendarService from "../services/calendarService"; // Import calendarService

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

  const getContactInfo = (contactId) => {
    return contacts.find((contact) => contact.id === contactId) || {};
  };

  const formatDate = (dateString) => {
    const date = new Date(dateString);
    return format(date, "EEEE dd 'at' hh:mmaaa");
  };

  const handleInputChange = (field, value) => {
    setNewEvent({ ...newEvent, [field]: value });
  };

  const handleAddEvent = () => {
    onAddEvent(newEvent);
    setNewEvent({ contactId: null, type: "email", date: null, notes: "" });
  };

  const handleEditEvent = (event) => {
    // Implement edit logic here
    calendarService.editEvent(event).then(() => {
      message.success("Event edited successfully");
      onClose();
    });
  };

  const handleDeleteEvent = (eventId) => {
    calendarService.deleteEvent(eventId).then(() => {
      message.success("Event deleted successfully");
      onClose(); // Close the drawer
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
      {isCreatingEvent ? (
        <Form layout="vertical" style={{ padding: 16 }}>
          <Form.Item label="Contact">
            <Select
              showSearch
              placeholder="Select a contact"
              onChange={(value) => handleInputChange("contactId", value)}
            >
              {contacts.map((contact) => (
                <Option key={contact.id} value={contact.id}>
                  {`${contact.firstName} ${contact.lastName}`}
                </Option>
              ))}
            </Select>
          </Form.Item>
          <Form.Item label="Type">
            <Select
              value={newEvent.type}
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
              onChange={(date) => handleInputChange("date", date)}
            />
          </Form.Item>
          <Form.Item label="Notes">
            <Input.TextArea
              value={newEvent.notes}
              onChange={(e) => handleInputChange("notes", e.target.value)}
            />
          </Form.Item>
          <Button type="primary" onClick={handleAddEvent}>
            Add Event
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
