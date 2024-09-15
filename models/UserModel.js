const db = require("../config/config");

exports.findUserByEmail = (email, callback) => {
  const sql = 'SELECT * FROM users WHERE email = ?';
  db.query(sql, [email], (err, result) => {
    if (err) {
      return callback(err, null);
    }
    return callback(null, result[0]);
  });
};
