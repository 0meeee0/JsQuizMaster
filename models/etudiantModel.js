const db = require('../config/config');



module.exports = {
  addStudent: (userData, studentData, callback) => {
    const userQuery = `
      INSERT INTO users (firstName, name, email, password, role, birthDay, adresse) 
      VALUES (?, ?, ?, ?, 'etudiant', ?, ?)
    `;

    db.query(
      userQuery,
      [
        userData.firstName,
        userData.name,
        userData.email,
        userData.password,
        userData.birthDay,
        userData.adresse,
      ],
      (err, result) => {
        if (err) {
          return callback(err, null);
        }

        const id_user = result.insertId;

        const studentQuery = `
        INSERT INTO etudiant (id_user, inscriptionDate) 
        VALUES (?, ?)
      `;

        db.query(
          studentQuery,
          [id_user, studentData.inscriptionDate],
          (err, result) => {
            if (err) {
              return callback(err, null);
            }
            return callback(null, result);
          }
        );
      }
    );
  },
  getAllStudents: () => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT users.firstName, users.name, users.email, users.birthDay, users.adresse, etudiant.inscriptionDate
        FROM users
        JOIN etudiant ON users.id_user = etudiant.id_user
        WHERE users.role = 'etudiant'
      `;
      db.query(query, (err, results) => {
        if (err) {
          return reject(err); 
        }
        resolve(results); 
      });
    });
  },
};
