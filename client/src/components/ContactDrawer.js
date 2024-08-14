import React from "react";
import { Drawer, Form, Input, Button, Avatar } from "antd";
import {
  UserOutlined,
  MailOutlined,
  PhoneOutlined,
  HomeOutlined,
} from "@ant-design/icons";
import "../styles/ContactDrawer.css"; // Import custom CSS

function ContactDrawer({ visible, onClose, contact, onSave }) {
  const [form] = Form.useForm();

  const handleSave = () => {
    form
      .validateFields()
      .then((values) => {
        onSave(values);
      })
      .catch((error) => {
        console.error("Validation failed:", error);
      });
  };

  return (
    <Drawer
      title="Contact Details"
      width="33%"
      onClose={onClose}
      visible={visible}
      bodyStyle={{ paddingBottom: 80 }}
      className="contact-drawer"
    >
      <Form form={form} layout="vertical" initialValues={contact || {}}>
        <Form.Item className="avatar-item">
          <Avatar size={64} src={contact?.avatar} className="avatar" />
        </Form.Item>
        <Form.Item
          name="firstName"
          label={
            <span>
              <UserOutlined /> First Name
            </span>
          }
          rules={[{ required: true, message: "Please enter first name" }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          name="lastName"
          label={
            <span>
              <UserOutlined /> Last Name
            </span>
          }
          rules={[{ required: true, message: "Please enter last name" }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          name="email"
          label={
            <span>
              <MailOutlined /> Email
            </span>
          }
          rules={[{ required: true, message: "Please enter email" }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          name="phoneNumber"
          label={
            <span>
              <PhoneOutlined /> Phone Number
            </span>
          }
          rules={[{ required: true, message: "Please enter phone number" }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          name="address"
          label={
            <span>
              <HomeOutlined /> Address
            </span>
          }
          rules={[{ required: true, message: "Please enter address" }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          name="avatar"
          label={
            <span>
              <UserOutlined /> Avatar URL
            </span>
          }
          rules={[{ required: true, message: "Please enter avatar URL" }]}
        >
          <Input />
        </Form.Item>
        <Form.Item>
          <Button type="primary" onClick={handleSave} className="save-button">
            Save
          </Button>
        </Form.Item>
      </Form>
    </Drawer>
  );
}

export default ContactDrawer;
