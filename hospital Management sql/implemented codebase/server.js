const dotenv = require("dotenv");
dotenv.config({ path: "./config.env" });

const app = require("./app");
const con = require("./dbconfig");

con.connect((er, con) => {
  if (!er) {
    console.log(
      "DB connection successfull. Using database " +
        process.env.DB_DATABASE_NAME
    );
  } else console.log(er);
});

const port = process.env.PORT;
app.listen(port, () => {
  console.log(`listening on port ${port}`);
});
