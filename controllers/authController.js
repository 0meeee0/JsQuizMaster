const userModel = require('../models/UserModel');

exports.showLoginForm = (req, res) => {
  res.render('index', { error: null }); 
};

exports.loginUser = (req, res) => {
  const { email, password } = req.body;
  
  if (!email || !password) {
    return res.render('index', { error: 'All fields are required.' });
  }

  userModel.findUserByEmail(email, (err, user) => {
    if (err) {
      return res.render('index', { error: 'Database error.' });
    }

    if (!user || user.password !== password) { 
      return res.render('index', { error: 'Invalid email or password.' });
    }

    res.send('Login successful');
  });
};
