const express = require('express');
const router = express.Router();
const studentController = require('../controllers/studentController');

router.get('/students', studentController.showAllStudents);

router.post('/students/add', studentController.addStudent);

router.get('/students/edit/:id', studentController.showStudentDetails);

router.post('/students/edit/:id', studentController.updateStudent);

router.post('/students/delete/:id', studentController.deleteStudent);

module.exports = router;
