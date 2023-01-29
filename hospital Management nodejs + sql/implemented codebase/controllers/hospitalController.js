const con = require("../dbconfig");

const executeQuery = (query,next) => {
  return new Promise(function (resolve, reject) {
    con.query(query, function (err, res, field) {
      if (err) next(err);
      resolve(res);
    });
  });
};
exports.getHospitalDetails = async (req, res, next) => {
  let hospitalName,
    totalPsychiatristsCount,
    totalPatientsCount,
    psychiatristDetail;

  //for getting hospital name
  hospitalName = await executeQuery(
    `select Name from hospitals where HospitalId=${req.body.hospitalId}`,
    next
  );

  //for getting total psychiatrist
  totalPsychiatristsCount = await executeQuery(
    `select count(PsychiatristId) from psychiatrists join hospitals on psychiatrists.HospitalId=hospitals.HospitalId where hospitals.HospitalId=${req.body.hospitalId}`,
    next
  );

  //for getting total patient count
  totalPatientsCount = await executeQuery(
    `select count(PatientId)
            from patients
            join psychiatrists on patients.PsychiatristId=psychiatrists.PsychiatristId
            join hospitals on psychiatrists.HospitalId =hospitals.HospitalId
            where hospitals.HospitalId=${req.body.hospitalId}`,
    next
  );

  //for getting pyschiatrists detail
  psychiatristDetail = await executeQuery(
    `SELECT psychiatrists.PsychiatristId, psychiatrists.Name, COUNT(patients.PatientId) as total_patients FROM psychiatrists LEFT JOIN patients ON psychiatrists.PsychiatristId = patients.PsychiatristId JOIN hospitals ON psychiatrists.HospitalId = hospitals.HospitalId WHERE hospitals.HospitalId = ${req.body.hospitalId}  GROUP BY psychiatrists.PsychiatristId, psychiatrists.Name`,
    next
  );
  res.status(200).json({
    status: "success",
    data: {
      hospitalName: hospitalName[0].Name,
      totalPsychiatristsCount:
        totalPsychiatristsCount[0]["count(PsychiatristId)"],
      totalPatientsCount: totalPatientsCount[0]["count(PatientId)"],
      psychiatristDetail,
    },
  });
};
