const db = require('../config/config');

// Get all students
exports.getAllStudents = (callback) => {
    db.query('SELECT * FROM users WHERE role = "etudiant"', (err, results) => {
        if (err) {
            console.error("Error fetching students: ", err);
            return callback(err);
        }
        callback(null, results);
    });
};

// Get a student by ID
exports.getStudentById = (id, callback) => {
    db.query('SELECT * FROM users WHERE id_user = ? AND role = "etudiant"', [id], (err, results) => {
        if (err) {
            console.error("Error fetching student by ID: ", err);
            return callback(err);
        }
        if (results.length === 0) {
            return callback(null, null); // No student found
        }
        callback(null, results[0]);
    });
};

// Create a new student
exports.createStudent = (student, callback) => {
    const { firstName, name, email, password, birthDate, address, inscriptionDate } = student;
    const query = 'INSERT INTO users (firstName, name, email, password, birthDay, address, role) VALUES (?, ?, ?, ?, ?, ?, "etudiant")';
    db.query(query, [firstName, name, email, password, birthDate, address], (err, results) => {
        if (err) {
            console.error("Error creating student: ", err);
            return callback(err);
        }
        callback(null, results);
    });
};

// Update a student
exports.updateStudent = (id, updatedStudent, callback) => {
    const query = `
        UPDATE users
        SET firstName = ?, name = ?, email = ?, birthDate = ?, address = ?, password = ?
        WHERE id_user = ?
    `;

    const values = [
        updatedStudent.firstName,
        updatedStudent.name,
        updatedStudent.email,
        updatedStudent.birthDate,
        updatedStudent.address,
        updatedStudent.password || null, 
        id_user
    ];

    db.query(query, values, callback);
};

// Delete a student
exports.deleteStudent = (id, callback) => {
    db.query('DELETE FROM users WHERE id_user = ?', [id], (err, results) => {
        if (err) {
            console.error("Error deleting student: ", err);
            return callback(err);
        }
        callback(null, results);
    });
};
