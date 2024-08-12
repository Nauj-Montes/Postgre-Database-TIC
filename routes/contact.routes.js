const { Router } = require("express");
const controller = require("../controllers/contact.controller");

const router = Router();

router.get("/", (req, res) => controller.getContacts(req, res));
router.post("/", (req, res) => controller.createContact(req, res));

router.get("/:id", (req, res) => controller.getContactById(req, res));
router.put("/:id", (req, res) => controller.updateContact(req, res));
router.delete("/:id", (req, res) => controller.deleteContact(req, res));

module.exports = router;

