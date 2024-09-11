const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');

router.get('/login', authController.showLoginForm);
router.post('/', authController.loginUser);
router.get('/logout',authController.logoutUser);

module.exports = router;