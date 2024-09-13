const express = require("express");
const router = express.Router();
const studentController = require("../controllers/etudientController");

router.get("/studentList", studentController.getStudents);
router.post("/add-student", studentController.addStudent);


module.exports = router;
