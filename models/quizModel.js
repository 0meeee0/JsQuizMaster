const db = require("../config/config");

module.exports = {
  quizList: () => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT * FROM quiz
      `;
      db.query(query, (err, results) => {
        if (err) {
          return reject(err);
        }
        resolve(results);
      });
    });
  },
};
