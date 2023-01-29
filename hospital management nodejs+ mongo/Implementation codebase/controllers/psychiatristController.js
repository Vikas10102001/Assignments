//Controller for psychiatrist
const Psychiatrist = require("../models/psychiatristModel");
const catchAsync = require("../utils/catchAsync");
const handlerFactory = require("../controllers/handlerFactory");

exports.register = catchAsync(async (req, res, next) => {
  //assuming that psychiatrist id will be present in request body
  const newPsychiatrist = await Psychiatrist.create(req.body);
  res.status(201).json({
    status: "success",
    data: newPsychiatrist,
  });
});

exports.getPsychiatrist = handlerFactory.getAll(Psychiatrist);
// exports.updatePsychiatrist=handlerFactory.updateOne(Psychiatrist)
// exports.deletePsychiatrist=handlerFactory.deleteOne(Psychiatrist)
