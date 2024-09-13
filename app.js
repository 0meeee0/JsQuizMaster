const express = require("express");
const app = express();
const authRoutes = require('./routes/UserRouter');
const studentRoutes = require("./routes/StudentRouter");
const quizRoutes = require("./routes/QuizRouter");
const session = require('express-session');

app.use(express.urlencoded({ extended: true }));

app.set('view engine', 'ejs');
app.use(session({
  secret: 'yourSecretKey',  
  resave: false,
  saveUninitialized: true,
  cookie: { maxAge: 60000 }  
}));

app.use(express.static('public'));

app.use('/', authRoutes);
app.use(studentRoutes);
app.use(quizRoutes);

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
