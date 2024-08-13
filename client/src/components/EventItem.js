import React from "react";
import {
  MailOutlined,
  PhoneOutlined,
  TeamOutlined,
  UserOutlined,
  QuestionCircleOutlined,
} from "@ant-design/icons";
import moment from "moment";

const iconMapping = {
  email: MailOutlined,
  call: PhoneOutlined,
  deal: TeamOutlined,
  meeting: UserOutlined,
  other: QuestionCircleOutlined,
};

const EventItem = ({ event }) => {
  const currentDate = moment().startOf("day");
  const eventDate = moment(event.date).startOf("day");
  const isPastEvent = eventDate.isBefore(currentDate);
  const eventClass = isPastEvent ? "past-event" : "upcoming-event";
  const Icon = iconMapping[event.type] || QuestionCircleOutlined;

  return (
    <li className={`event-item ${eventClass}`}>
      <Icon className="event-icon" />
      <span className="event-text">
        {event.type.charAt(0).toUpperCase() + event.type.slice(1).toLowerCase()}
      </span>
    </li>
  );
};

export default EventItem;
