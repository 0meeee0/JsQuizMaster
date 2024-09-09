const db = require('../config/config');

exports.getAllUsers = (callback) => {
  const sql = 'SELECT * FROM users';
  db.query(sql, (err, results) => {
    if (err) {
      console.error('Error fetching users:', err);
      return callback(err, null);
    }
    callback(null, results);
  });
};
