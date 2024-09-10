const User = require('../models/UserModel');

exports.showLoginForm = (req, res) => {
    res.render('index', { error: null });
  };

  exports.loginUser = (req, res) => {
    const { username, password } = req.body;
    
    UserModel.findUserByUsername(username, (err, user) => {
      if (err) {
        console.error('Database error:', err);
        return res.status(500).send('Database error');
      }
  
      if (user && user.password === password) {
        res.send('Login successful!');
      } else {
        res.render('login', { error: 'Invalid username or password' });
      }
    });
  };
