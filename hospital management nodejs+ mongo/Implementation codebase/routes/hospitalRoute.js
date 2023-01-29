const express=require("express")
const router=express.Router()
const hospitalController=require('../controllers/hospitalController')

router.route('/').get(hospitalController.getHospitalDetails)

module.exports=router