const studentModel = require('../models/StudentModel');
const bcrypt = require('bcrypt'); // Make sure to install bcrypt for hashing passwords

// Show all students
exports.showAllStudents = (req, res) => {
    studentModel.getAllStudents((err, students) => {
        if (err) {
            console.error("Error fetching students:", err);
            return res.status(500).send('Server error');
        }
        res.render('pages/studentList', { students });
    });
};

// Show student details
exports.showStudentDetails = (req, res) => {
    const { id } = req.params;
    studentModel.getStudentById(id, (err, student) => {
        if (err) {
            console.error("Error fetching student:", err);
            return res.status(500).send('Server error');
        }
        res.render('pages/editStudent', { student });
    });
};

// Add a new student
exports.addStudent = async (req, res) => {
    try {
        // Hash the password before storing
        const hashedPassword = await bcrypt.hash(req.body.password || 'default_password', 10);

        const newStudent = {
            firstName: req.body.firstName,
            name: req.body.name,
            email: req.body.email,
            birthDay: req.body.birthDate,
            address: req.body.address,
            password: hashedPassword, // Store hashed password
            role: 'etudiant',
        };
        studentModel.createStudent(newStudent, (err, results) => {
            if (err) {
                console.error("Error adding student:", err);
                return res.status(500).send('Server error');
            }
            res.redirect('/students');
        });
    } catch (err) {
        console.error("Error hashing password:", err);
        res.status(500).send('Server error');
    }
};

// Update an existing student
exports.updateStudent = async (req, res) => {
    const { id } = req.params;

    try {
        const updatedStudent = {
            firstName: req.body.firstName,
            name: req.body.name,
            email: req.body.email,
            birthDate: req.body.birthDate,
            address: req.body.address,
        };

        // Update password if provided
        if (req.body.password) {
            updatedStudent.password = await bcrypt.hash(req.body.password, 10);
        }

        studentModel.updateStudent(id, updatedStudent, (err, results) => {
            if (err) {
                console.error("Error updating student:", err);
                return res.status(500).send('Server error');
            }
            res.redirect('/students');
        });
    } catch (err) {
        console.error("Error hashing password:", err);
        res.status(500).send('Server error');
    }
};
// Delete a student
exports.deleteStudent = (req, res) => {
    const { id } = req.params;
    studentModel.deleteStudent(id, (err, results) => {
        if (err) {
            console.error("Error deleting student:", err);
            return res.status(500).send('Server error');
        }
        res.redirect('/students');
    });
};
