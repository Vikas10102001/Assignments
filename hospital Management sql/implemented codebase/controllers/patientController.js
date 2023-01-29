const con = require("../dbconfig");
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
const resizeUserPhoto = async (req, res, next, patientId) => {
  if (!req.file) return;
  else {
    filename = `patient-${req.body.phoneNumber}-${Date.now()}.jpeg`;
    sharp(req.file.buffer)
      .resize(500, 500)
      .toFormat("jpeg")
      .jpeg({ quality: 90 })
      .toFile(`public/img/patients/${filename}`);
    let query = `Update patients set Photo='${filename}' where PatientId='${patientId}'`;

    con.query(query);
  }
};

exports.register = async (req, res, next) => {
  //assuming that psychiatrist id will be present in request body

  let query = req.body.photo
    ? `insert into patients (Name,Email,Address,PhoneNumber,Password,Photo,PsychiatristId) values ('${req.body.name}','${req.body.email}','${req.body.address}','${req.body.phoneNumber}','${req.body.password}','${req.body.photo}','${req.body.psychiatristId}')`
    : `insert into patients (Name,Email,Address,PhoneNumber,Password,PsychiatristId) values ('${req.body.name}','${req.body.email}','${req.body.address}','${req.body.phoneNumber}','${req.body.password}','${req.body.psychiatristId}')`;

  con.query(query, async (er, result) => {
    if (er) return next(er);
    await resizeUserPhoto(req, res, next, result.insertId);
    res.status(201).json({
      status: "success",
      data: "created successfully",
    });
  });
};

exports.getAllPatient = (req, res, next) => {
  con.query("Select * from patients", (er, result) => {
    if (er) {
      return next(er);
    }
    res.status(200).json({
      status: "success",
      results: result.length,
      data: result,
    });
  });
};
