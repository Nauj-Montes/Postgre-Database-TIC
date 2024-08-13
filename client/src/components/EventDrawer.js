import React from "react";
import { Drawer, List, Row, Col, Avatar } from "antd";
import {
  PhoneOutlined,
  HomeOutlined,
  BankOutlined,
  UserOutlined,
} from "@ant-design/icons";
import { format } from "date-fns";
import EventItem from "./EventItem";

const EventDrawer = ({ visible, onClose, events, contacts }) => {
  const getContactInfo = (contactId) => {
    return contacts.find((contact) => contact.id === contactId) || {};
  };

  const formatDate = (dateString) => {
    const date = new Date(dateString);
    return format(date, "EEEE dd 'at' hh:mmaaa");
  };

  return (
    <Drawer
      title="Events"
      placement="right"
      onClose={onClose}
      open={visible}
      bodyStyle={{ padding: 0 }}
    >
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
            </List.Item>
          );
        }}
      />
    </Drawer>
  );
};

export default EventDrawer;
