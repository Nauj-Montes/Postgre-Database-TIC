import React from "react";
import {
  List,
  ListItem,
  ListItemAvatar,
  Avatar,
  ListItemText,
  ListItemSecondaryAction,
  IconButton,
} from "@mui/material";
import EditIcon from "@mui/icons-material/Edit";
import DeleteIcon from "@mui/icons-material/Delete";
import "../styles/ContactList.css"; // Import the CSS file

function ContactList({ contacts }) {
  return (
    <List>
      {contacts.map((contact) => (
        <ListItem key={contact.id} className="styled-list-item">
          <ListItemAvatar>
            <Avatar
              src={contact.avatar}
              alt={`${contact.firstName} ${contact.lastName}`}
              className="contact-avatar"
            />
          </ListItemAvatar>
          <ListItemText
            primary={`${contact.firstName} ${contact.lastName}`}
            secondary={
              <div className="contact-details">
                <p>Phone: {contact.phoneNumber}</p>
                <p>Address: {contact.address}</p>
                <p>Email: {contact.email}</p>
              </div>
            }
          />
          <ListItemSecondaryAction>
            <IconButton edge="end" aria-label="edit">
              <EditIcon />
            </IconButton>
            <IconButton edge="end" aria-label="delete">
              <DeleteIcon />
            </IconButton>
          </ListItemSecondaryAction>
        </ListItem>
      ))}
    </List>
  );
}

export default ContactList;
