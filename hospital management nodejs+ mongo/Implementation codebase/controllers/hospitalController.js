const Hospital = require("../models/hospitalModel");
const catchAsync = require("../utils/catchAsync");

exports.getHospitalDetails = catchAsync(async (req, res, next) => {
 
  //assuming that psychiatrist id will be present in request body
  const hospital = await Hospital.findOne(req.body.hodpitalId).populate({
    path: "psychiatrists",
    select: "name patient patientCount",
  });
  

  let psychiatristDetail=[];
  hospital.psychiatrists.forEach((el,i)=>{
    psychiatristDetail[i]={
        id:el.id,
        name:el.name,
        patientCount:el.patientCount
    }
  })

  res.status(200).json({
    status: "success",
    data: {
      hospitalName: hospital.name,
      totalPsychiatristCount: hospital.psychiatrists.length,
      totalPatientsCount:hospital.totalPatientsCount,
      psychiatristDetail
    },
  });
});
