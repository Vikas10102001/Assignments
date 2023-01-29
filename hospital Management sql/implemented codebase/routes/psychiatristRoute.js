const express = require("express");
const router = express.Router();
const psychiatrist = require("../controllers/psychiatristController");

router.route("/").post(psychiatrist.register);
router.route("/").get(psychiatrist.getPsychiatrist);

module.exports = router;
