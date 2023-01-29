const mongoose = require("mongoose");
const validator = require("validator");
const bcrypt = require("bcryptjs");
const patientSchema = new mongoose.Schema(
  {
    name: {
      type: String,
      required: [true, "Please give patient name"],
    },
    address: {
      type: String,
      required: [true, "Please give patient address"],
      minlength: 10,
    },
    email: {
      type: String,
      lowercase: true,
      validate: [validator.isEmail, "Please enter a valid email"],
      required: [true, "Please give your email"]
    },
    phoneNumber: {
      type: String,
      minlength: 10,
      //assuming both country code and phone no. are sent together
      validate: {
        validator: function (val) {
          let number=val.split('+')[1]
          return (val[0] === "+")&& (/^\d+$/.test(number));
        },
        message: "Please fill a valid phone number with a proper country code ",
      },
    },
    photo: { type: String, default: "default.jpg" },
    password: {
      type: String,
      required: [true, "Please give a password"],
      minlength: 8,
      maxlength: 15,
      validate: {
        validator: function (val) {
          var pattern = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).+$");
          return pattern.test(val);
        },
        message:
          "Password must contain one upper character,one lower character and a number",
      },
      select: false,
    },
    psychiatrist: {
      type: mongoose.Schema.ObjectId,
      ref: "Psychiatrist",
      required: [true, "Please provide a psychiatrist identity for a patient"],
    },
  },
  {
    timestamps: true,
  }
);

//creating index for unique values of name,phoneNumber,psychiatrist to ensure register duplicacy
patientSchema.index(
  { name: 1, phoneNumber: 1, psychiatrist: 1 },
  { unique: true }
);

patientSchema.pre("save", async function () {
  //hash the passowrd before saving
  this.password = await bcrypt.hash(this.password, 12);
});
const Patient = mongoose.model("patient", patientSchema);

module.exports = Patient;
