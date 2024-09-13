const db = require("../config/config"); // Assuming db config is in this file

module.exports = {
  // Function to add a new quiz
  addQuiz: (quizData, callback) => {
    const quizQuery = `
      INSERT INTO quiz (score, answerVisibility, chances, feedback)
      VALUES (?, ?, ?, ?)
    `;
    return quizQuery
    db.query(
      quizQuery,
      [
        quizData.score,
        quizData.answerVisibility,
        quizData.chances,
        quizData.feedback,
      ],
      (err, result) => {
        if (err) {
          return callback(err, null);
        }
        return callback(null, result);
      }
    );
  },
};
