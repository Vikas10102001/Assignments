const express=require("express")
const app= express()
const cors=require("cors")
const errorController = require("./controllers/errorController")
const patientRouter=require("./routes/patientRoute")
const psychiatristRouter=require("./routes/psychiatristRoute")
const hospitalRouter=require("./routes/hospitalRoute")

app.use(express.json())
app.use(cors())
app.use('/api/v1/patient',patientRouter)
app.use('/api/v1/psychiatrist',psychiatristRouter)
app.use('/api/v1/hospital',hospitalRouter)

//error handling middleware
app.use(errorController)

module.exports=app