import React, { useState, useEffect } from "react";
import {
  Drawer,
  Form,
  Button,
  Col,
  Row,
  Input,
  Avatar,
  Select,
  Card,
} from "antd";
import { EditOutlined, SaveOutlined, CloseOutlined } from "@ant-design/icons";
import ContactService from "../services/contactService";
import "../styles/CompanyDrawer.css"; // Import custom CSS

const { Option } = Select;

const CompanyDrawer = ({
  visible,
  onClose,
  company,
  onSave,
  selectedSearchQueryId,
  refreshCompanies,
}) => {
  const [form] = Form.useForm();
  const [companyData, setCompanyData] = useState({
    id: "",
    phoneNumber: "",
    address: "",
    avatar: "",
    firstName: "",
    lastName: "",
    email: "",
    companyName: "",
    industry: "",
    companyLogo: "",
    companyDeals: "",
    companyRevenue: "",
    createdAt: "",
    updatedAt: "",
    salesOwner: "",
  });
  const [contacts, setContacts] = useState([]);
  const [filteredContacts, setFilteredContacts] = useState([]);
  const [isEditingSalesOwner, setIsEditingSalesOwner] = useState(false);

  useEffect(() => {
    if (company) {
      setCompanyData(company);
      form.setFieldsValue(company);
      const selectedContact = contacts.find(
        (contact) => contact.id === company.salesOwner
      );
      if (selectedContact) {
        form.setFieldsValue({
          salesOwner: `${selectedContact.firstName} ${selectedContact.lastName}`,
        });
      }
    }
  }, [company, form, contacts]);

  useEffect(() => {
    const fetchContacts = async () => {
      const result = await ContactService.getContacts();
      setContacts(result);
      setFilteredContacts(result);
    };
    fetchContacts();
  }, []);

  useEffect(() => {
    if (selectedSearchQueryId) {
      setCompanyData((prevData) => ({
        ...prevData,
        id: selectedSearchQueryId,
      }));
    }
  }, [selectedSearchQueryId]);

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setCompanyData((prevData) => ({ ...prevData, [name]: value }));
  };

  const handleSalesOwnerChange = async (value) => {
    try {
      const selectedContact = await ContactService.getContactById(value);
      if (selectedContact) {
        const updatedCompanyData = {
          ...companyData,
          salesOwner: value,
          firstName: selectedContact.firstName || companyData.firstName,
          lastName: selectedContact.lastName || companyData.lastName,
          email: selectedContact.email || companyData.email,
          phoneNumber: selectedContact.phoneNumber || companyData.phoneNumber,
          address: selectedContact.address || companyData.address,
          avatar: selectedContact.avatar || companyData.avatar,
        };

        setCompanyData(updatedCompanyData);
        form.setFieldsValue({
          firstName: updatedCompanyData.firstName,
          lastName: updatedCompanyData.lastName,
          email: updatedCompanyData.email,
          phoneNumber: updatedCompanyData.phoneNumber,
          address: updatedCompanyData.address,
        });
      }
    } catch (error) {
      console.error("Failed to fetch contact details:", error);
    }
  };

  const handleSearch = (value) => {
    const filtered = contacts.filter((contact) =>
      `${contact.firstName} ${contact.lastName}`
        .toLowerCase()
        .includes(value.toLowerCase())
    );
    setFilteredContacts(filtered);
  };

  const handleSave = async () => {
    try {
      // Create a copy of companyData and replace empty strings with null
      const sanitizedData = { ...companyData };
      Object.keys(sanitizedData).forEach((key) => {
        if (sanitizedData[key] === "") {
          sanitizedData[key] = null;
        }
      });

      // Ensure id is not null by setting it to the selected contact's id if available
      if (!sanitizedData.id && companyData.salesOwner) {
        const selectedContact = contacts.find(
          (contact) => contact.id === companyData.salesOwner
        );
        if (selectedContact) {
          sanitizedData.id = selectedContact.id;
        }
      }

      console.log("Sanitized Data:", sanitizedData); // Log sanitized data

      let updatedContact;
      if (sanitizedData.id) {
        updatedContact = await ContactService.updateContact(
          sanitizedData.id,
          sanitizedData
        );
      } else {
        updatedContact = await ContactService.updateContact(sanitizedData);
      }

      console.log("Updated Contact:", updatedContact); // Log updated contact
      refreshCompanies();

      setCompanyData(updatedContact);
      form.setFieldsValue(updatedContact);
      onSave(updatedContact);
    } catch (error) {
      console.error("Failed to save contact:", error);
    }
  };

  return (
    <Drawer
      title="Company Details"
      width={720}
      onClose={onClose}
      visible={visible}
      bodyStyle={{ paddingBottom: 80 }}
      className="company-drawer"
      footer={
        <div
          style={{
            textAlign: "right",
          }}
        >
          <Button
            onClick={onClose}
            style={{ marginRight: 8 }}
            icon={<CloseOutlined />}
          >
            Cancel
          </Button>
          <Button onClick={handleSave} type="primary" icon={<SaveOutlined />}>
            Save
          </Button>
        </div>
      }
    >
      <Form layout="vertical" form={form}>
        <Card title="Company Information" style={{ marginBottom: 16 }}>
          <Row gutter={16}>
            <Col span={12}>
              <Form.Item name="companyName" label="Company Name">
                <Input name="companyName" onChange={handleInputChange} />
              </Form.Item>
            </Col>
            <Col span={12}>
              <Form.Item name="industry" label="Industry">
                <Select
                  name="industry"
                  onChange={(value) =>
                    setCompanyData((prevData) => ({
                      ...prevData,
                      industry: value,
                    }))
                  }
                >
                  <Option value="Technology">Technology</Option>
                  <Option value="Healthcare">Healthcare</Option>
                  <Option value="Finance">Finance</Option>
                  <Option value="Education">Education</Option>
                  <Option value="Retail">Retail</Option>
                  <Option value="Manufacturing">Manufacturing</Option>
                  <Option value="Real Estate">Real Estate</Option>
                  <Option value="Transportation">Transportation</Option>
                  <Option value="Energy">Energy</Option>
                  <Option value="Entertainment">Entertainment</Option>
                </Select>
              </Form.Item>
            </Col>
          </Row>
          <Row gutter={16}>
            <Col span={12}>
              <Form.Item name="companyRevenue" label="Company Revenue">
                <Input name="companyRevenue" onChange={handleInputChange} />
              </Form.Item>
            </Col>
            <Col span={12}>
              <Form.Item name="companyDeals" label="Company Deals">
                <Input name="companyDeals" onChange={handleInputChange} />
              </Form.Item>
            </Col>
          </Row>
        </Card>
        <Card title="Sales Owner Contact Information">
          <Row gutter={16}>
            <Col span={24}>
              <Form.Item name="salesOwner" label="Sales Owner">
                {isEditingSalesOwner ? (
                  <Select
                    showSearch
                    placeholder="Select a sales owner"
                    onSearch={handleSearch}
                    onChange={handleSalesOwnerChange}
                    filterOption={false}
                  >
                    {filteredContacts.map((contact) => (
                      <Option key={contact.id} value={contact.id}>
                        <Avatar
                          src={contact.avatar}
                          size="small"
                          style={{ marginRight: 8 }}
                        />
                        {contact.firstName} {contact.lastName}
                      </Option>
                    ))}
                  </Select>
                ) : (
                  <Input
                    value={form.getFieldValue("salesOwner")}
                    disabled
                    addonAfter={
                      <Button
                        type="link"
                        onClick={() => setIsEditingSalesOwner(true)}
                        icon={<EditOutlined />}
                      >
                        Edit
                      </Button>
                    }
                  />
                )}
              </Form.Item>
            </Col>
          </Row>
        </Card>
      </Form>
    </Drawer>
  );
};

export default CompanyDrawer;
