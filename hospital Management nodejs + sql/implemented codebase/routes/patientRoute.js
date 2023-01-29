const express = require("express");
const router = express.Router();
const patientController = require("../controllers/patientController");
const validationAndEncryption=require("../controllers/validationAndEncryption")

router
  .route("/")
  .post(
    patientController.uploadUserPhoto,
    validationAndEncryption.dataValidation,
    validationAndEncryption.encryptPassword,
    patientController.register
  )
  .get(patientController.getAllPatient);

module.exports = router;
