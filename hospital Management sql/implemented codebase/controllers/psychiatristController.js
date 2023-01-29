const con = require("../dbconfig");

exports.register = (req, res, next) => {
  //assuming that psychiatrist id will be present in request body
  let query = `insert into psychiatrists (Name,Email,PhoneNumber,HospitalId) values ('${req.body.name}','${req.body.email}','${req.body.phoneNumber}','${req.body.hospitalId}')`;
  con.query(query, (er, result) => {
    if (er) return next(er);
    // console.log(result)
    res.status(201).json({
      status: "success",
      message: "created successfully",
    });
  });
};

exports.getPsychiatrist = (req, res, next) => {
  con.query("Select * from psychiatrists", (er, result) => {
    if (er) {
      return next(er);
    }
    res.status(200).json({
      status: "success",
      data: result,
    });
  });
};
