const QuizModel = require("../models/quizModel");

exports.createQuiz = async (req, res) => {

    res.render('pages/quizCreation');
  
};

exports.quizList = async (req, res) => {
    try{
        const quizList = await QuizModel.quizList();
        res.render('pages/quizm', { quizList });
    } catch(err){
        console.error('Error fetching quizzes:', err);
        res.status(500).send('Error fetching quizzes');
    }
}
