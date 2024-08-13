import React, { useState } from "react";
import { Calendar as AntdCalendar } from "antd";
import moment from "moment";
import "../styles/Calendar.css";
import EventDrawer from "./EventDrawer";
import EventItem from "./EventItem";

const Calendar = ({ events, contacts }) => {
  const [drawerVisible, setDrawerVisible] = useState(false);
  const [selectedEvents, setSelectedEvents] = useState([]);

  const getListData = (value) => {
    const date = value.format("YYYY-MM-DD");
    return events.filter(
      (event) => moment(event.date).format("YYYY-MM-DD") === date
    );
  };

  const dateCellRender = (value) => {
    const listData = getListData(value);

    return (
      <ul className="events">
        {listData.map((item, index) => (
          <EventItem key={index} event={item} />
        ))}
      </ul>
    );
  };

  const onDateSelect = (value) => {
    const listData = getListData(value);
    setSelectedEvents(listData);
    setDrawerVisible(true);
  };

  return (
    <>
      <AntdCalendar
        dateCellRender={dateCellRender}
        onSelect={onDateSelect}
        className="custom-calendar"
      />
      <EventDrawer
        visible={drawerVisible}
        onClose={() => setDrawerVisible(false)}
        events={selectedEvents}
        contacts={contacts}
      />
    </>
  );
};

export default Calendar;
