const express = require("express");
const router = express.router();
const UserController = require('../controllers/userController');

router.get('/',UserController.getallUsers);

module.exports = router;