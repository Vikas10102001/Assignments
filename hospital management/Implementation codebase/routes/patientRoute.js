const express = require("express");
const router = express.Router();
const patientController = require("../controllers/patientController");

router
  .route("/")
  .post(patientController.uploadUserPhoto, patientController.register)
  .get(patientController.getAllPatient);

module.exports = router;
