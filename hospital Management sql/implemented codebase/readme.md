# config.env file

    this file will include
      PORT
      DB_HOST
      DB_PORT
      DB_USER
      DB_DATABASE_NAME
      DB_PASSWORD


# packages used

  Dependencies
    
    "bcryptjs": "^2.4.3"       - For encrypting the password
    "cors": "^2.8.5"           - For cross origin resource sharing
    "dotenv": "^16.0.3",       - For configuiring our environment (.env) file
    "express": "^4.18.2",      - express provides many features for our app 
    "mysql2": "^3.0.1",        - mysql driver used for connecting db with our app and querying
    "multer": "^1.4.5-lts.1",  - For parsing multipart data
    "sharp": "^0.31.3",        - For editing image upload of patient
    "validator": "^13.7.0"     - For validating the data like email

  devDependencies

    "nodemon": "^2.0.20"  - For restarting server automatically whenever any changes occur in our app


# Api Endpoint details

  routes    -      method  -     result

  /patient   -     POST    -    register new patient

  /patient    -   GET     -    get all patient

  /psychiatrist  -  POST   -     register new psychiatrist
  
  /psychiatrist  -   GET     -    get all psychiatrists

  /hospital    -   GET     -    get Hospital details (name,patient count,psychiatrist count,array 
                              containing psychiatrist details)


# Postman Link
  https://www.postman.com/supply-architect-79295102/workspace/assignment/collection/24255922-d373cff6-8755-4415-a3da-32a481092377?action=share&creator=24255922

  environment :Hospital management 
