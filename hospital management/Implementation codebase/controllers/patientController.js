const Patient = require("../models/patientModel");
const catchAsync = require("../utils/catchAsync");
const handlerFactory = require("../controllers/handlerFactory");
const Psychiatrist = require("../models/psychiatristModel");
const multer = require("multer");
const sharp = require("sharp");

const multerStorage = multer.memoryStorage();
const multerFilter = (req, file, cb) => {
  if (file.mimetype.startsWith("image")) {
    cb(null, true);
  } else {
    cb(new AppError(400, "Not an image ! Please upload an image"), false);
  }
};
const upload = multer({ storage: multerStorage, fileFilter: multerFilter });

//resizing and saving patient photo in public folder
exports.uploadUserPhoto = upload.single("photo");
const resizeUserPhoto = async (req, res, next, newPatient) => {
  if (!req.file) next();
  else {
    filename = `patient-${req.body.phoneNumber}-${Date.now()}.jpeg`;
    sharp(req.file.buffer)
      .resize(500, 500)
      .toFormat("jpeg")
      .jpeg({ quality: 90 })
      .toFile(`public/img/patients/${filename}`);
    return await Patient.findByIdAndUpdate(newPatient._id, { photo: filename },{new:true});
    next();
  }
};

exports.register = catchAsync(async (req, res, next) => {
  //assuming that psychiatrist id will be present in request body
  const newPatient = await Patient.create(req.body);
  await Psychiatrist.findByIdAndUpdate(req.body.psychiatrist, {
    $push: { patient: newPatient._id },
  });
  const patient =await resizeUserPhoto(req, res, next, newPatient);
  res.status(201).json({
    status: "success",
    data: patient, 
  });
});

exports.updatePatient = handlerFactory.updateOne(Patient);
exports.deletePatient = handlerFactory.deleteOne(Patient);
exports.getAllPatient = handlerFactory.getAll(Patient);
