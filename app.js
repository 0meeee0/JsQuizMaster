const express = require("express");
const app = express();
const port = 3000;
const path = require("path");
const bodyParser = require("body-parser");

app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, "public")));

app.set("view engine", "ejs");
app.get("/", (req, res) => {
  res.render("index");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
});
app.post("/login", (req, res) => {
  const { username, password } = req.body;
  if (!username || !password) {
    return res.send("enter cred");
  }
  res.render("pages/home", { username: username });
});

app.get("/studentList", (req, res) => {
  res.render("pages/studentList");
});
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
