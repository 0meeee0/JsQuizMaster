const QuizModel = require("../models/quizModel");

exports.createQuiz = async (req, res) => {
  try {
    const { quizName } = req.body;

    const newQuiz = new QuizModel({
      name: quizName,
    });

    await newQuiz.save();
    res.redirect(`/pages/quizCreation/${newQuiz._id}`);
  } catch (err) {
    console.error("Error creating quiz:", err);
    res.status(500).send("Server Error");
  }
};
