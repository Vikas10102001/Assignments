const mongoose = require("mongoose");

const hospitalSchema = new mongoose.Schema(
  {
    name: {
      type: String,
      required: [true, "Please give hospital name"],
    },
    psychiatrists: {
      type: [{ type: mongoose.Schema.ObjectId, ref: "Psychiatrist" }],
      validate: {
        validator: function (val) {
          return val.length >= 5;
        },
        message: "There must be atleast 5 psychiatrists for a hospital",
      },
    },
  },
  {
    timestamps: true,
    toJSON: { virtuals: true }, //options for virtual fields
    toObject: { virtuals: true },
  }
);

hospitalSchema.virtual("totalPatientsCount").get(function () {
  let totalPatientsCount = 0;
  for (let i = 0; i < this.psychiatrists.length; i++)
    totalPatientsCount += this.psychiatrists[i].patient.length;
  return totalPatientsCount;
});

const Hospital = mongoose.model("Hospital", hospitalSchema);

module.exports = Hospital;
