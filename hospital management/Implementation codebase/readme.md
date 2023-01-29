# config.env file

    this file will include
     1-PORT
     2-DATABASE_CONNECTION
     3-DATABASE_PASSWORD

# packages used

  Dependencies
    
    "bcryptjs": "^2.4.3"      - For encrypting the password
    "cors": "^2.8.5",         - For cross origin resource sharing
    "dotenv": "^16.0.3",      - For configuiring our environment (.env) file
    "express": "^4.18.2",     - express provides many features for our app 
    "mongoose": "^6.9.0",     - mongoDB driver used for connecting db with our app , creating        
                                schemas and models and many more
    "multer": "^1.4.5-lts.1", - For parsing multipart data
    "sharp": "^0.31.3",       - For editing image upload of patient
    "validator": "^13.7.0"    - For validating the data like email

  devDependencies

    "nodemon": "^2.0.20" - For restarting server automatically whenever any changes occur in our app


# Api Endpoint details

  routes                  method       result

  /api/v1/patient         POST        register new patient 
  /ap1/v1/patient         GET         get all patient

  /ap1/v1psychiatrist     POST        register new psychiatrist
  /api/v1psychiatrist     GET         get all psychiatrists

  /api/v1/hospital        GET         get Hospital details (name,patient count,psychiatrist count,  
                                      array containing psychiatrist details)
                              

# Postman Link
  https://www.postman.com/supply-architect-79295102/workspace/assignment/collection/24255922-3d59698c-f370-4494-9f96-0e8a6e63b8dd?action=share&creator=24255922

  environment :Hospital management 
