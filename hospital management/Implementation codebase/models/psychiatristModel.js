const mongoose = require("mongoose");
const bcrypt = require("bcryptjs");
const validator = require("validator");

const psychiatristSchema = new mongoose.Schema(
  {
    name: {
      type: String,
      required: [true, "Please give your name"],
    },
    email: {
      type: String,
      required: [true, "Please give your email"],
      unique: true,
      lowercase: true,
      validate: [validator.isEmail, "Please enter a valid email"],
    },
    phoneNumber: {
      type: String,
      minlength: 10,
      unique: true,
      required: [true, "Please give your phone number"],
    },
    password: {
      type: String,
      required: [true, "Please give your password"],
      minlength: 8,
      maxlength: 15,
      select: false,
    },
    hospital: {
      type: mongoose.Schema.ObjectId,
      ref: "hospitals",
      required: [
        true,
        "Please provide the name of hospital psychiatrist belong to",
      ],
    },
    patient: [{ type: mongoose.Schema.ObjectId, ref: "Patient" }],
  },
  {
    timestamps: true,
    toJSON: { virtuals: true }, //options for virtual fields
    toObject: { virtuals: true },
  }
);


psychiatristSchema.virtual("patientCount").get(function () {
  return this.patient.length;
});

psychiatristSchema.pre("save", async function () {
  //hash the passowrd before saving
  this.password = await bcrypt.hash(this.password, 12);
});
const Psychiatrist = mongoose.model("Psychiatrist", psychiatristSchema);

module.exports = Psychiatrist;
