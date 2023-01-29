const bcrypt=require('bcryptjs')
const validator=require('validator')
const sendValidationErrorResponse = (res, message) => {
  res.status(400).json({
    status: "failed",
    message: `Validation error : ${message} `,
  });
};

exports.dataValidation = (req, res, next) => {
  if (!validator.isEmail(req.body.email))
    return sendValidationErrorResponse(res, "Please enter a valid email");
  if (req.body.address.length < 10)
    return sendValidationErrorResponse(
      res,
      "Address should me minimum 10 characters"
    );

  let number = req.body.phoneNumber.split("+")[1];
  if (
    req.body.phoneNumber.length < 10 ||
    req.body.phoneNumber[0] !== "+" ||
    !/^\d+$/.test(number)
  )
    return sendValidationErrorResponse(
      res,
      "Please fill a valid phone number with a proper country code "
    );

    var pattern = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).+$");
  if (!pattern.test(req.body.password)) {
    return sendValidationErrorResponse(
      res,
      "Password must contain one upper character,one lower character and a number"
    );
  }
  next();
};

exports.encryptPassword = async (req, res, next) => {
  req.body.password = await bcrypt.hash(req.body.password, 12);
  next();
};
