const userModel = require('../models/UserModel');

exports.showLoginForm = (req, res) => {
  if (req.session.userId) {
    return res.send('You are already logged in');
  }
  res.render('index', { error: null });
};

exports.loginUser = (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.render('index', { error: 'All fields are required.' });
  }

  userModel.findUserByEmail(email, (err, user) => {
    if (err) {
      console.error('Database error:', err);
      return res.render('index', { error: 'Database error.' });
    }

    if (!user || user.password !== password) {
      return res.render('index', { error: 'Invalid email or password.' });
    }

    req.session.userId = user.id_user;

    req.session.user = user;

    console.log("Session created with userId:", req.session.userId);

    res.redirect('/dashboard'); 
  });
};

exports.logoutUser = (req, res) => {
  req.session.destroy((err) => {
    if (err) {
      console.error('Error logging out:', err);
      return res.send('Error logging out');
    }
    res.redirect('/');
  });
};
