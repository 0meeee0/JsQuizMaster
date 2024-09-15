const express = require("express");
const router = express.Router();
const quizController = require("../controllers/quizController");

router.get("/quiz", quizController.quizList);
router.get("/quizCreation", (req, res) => {
  res.render("pages/quizCreation");
});
router.post("/create-quiz", quizController.createQuiz);
router.get("/omar", (req, res) => {
    res.render("pages/quizCreation");
})

module.exports = router;