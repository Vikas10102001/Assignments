const dotenv = require("dotenv");
dotenv.config({ path: "./config.env" });

const app = require("./app");
const mongoose = require("mongoose");

let con = process.env.DB_CONNECTION;
con = con.replace("<PASSWORD>", process.env.DB_PASSWORD);
// con = 'mongodb://127.0.0.1:27017/database-name' for locally running database
try {
  mongoose.set("strictQuery", true);
  mongoose.connect(con).then(() => {
    console.log("DB Connection successfull");
  });
} catch (er) {
  console.log(er);
}
const port = process.env.PORT;
app.listen(port, () => {
  console.log(`listening on port ${port}`);
});
