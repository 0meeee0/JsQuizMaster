const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');

router.get('/', authController.showLoginForm);
router.post('/login', authController.loginUser);

module.exports = router;