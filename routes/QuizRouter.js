const express = require("express");
const router = express.Router();
const quizController = require("../controllers/quizController");

router.get("/quiz", (req, res) => {
  res.render("pages/quizm");
});
router.get("/quizCreation", (req, res) => {
  res.render("pages/quizCreation");
});
router.post("/create-quiz", quizController.createQuiz);


module.exports = router;