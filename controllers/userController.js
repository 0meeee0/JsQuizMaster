const User = require('../models/UserModel');

exports.getAllUsers = (req, res) => {
  User.getAllUsers((err, users) => {
    if (err) {
      return res.status(500).send('An error occurred while fetching users');
    }
    res.render('index', { users });
  });
};
