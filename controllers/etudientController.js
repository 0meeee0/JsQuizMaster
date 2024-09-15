const studentModel = require("../models/etudiantModel");

exports.getStudents = async (req, res) => {
  try {
    const students = await studentModel.getAllStudents();
    res.render("pages/studentList", { students });
  } catch (err) {
    console.error("Error fetching students:", err);
    res.status(500).send("Error fetching students");
  }
};

exports.addStudent = (req, res) => {
  const { fullName, name, email, password, birthDay, adresse } = req.body;

  const userData = {
    firstName: fullName,
    name: name,
    email: email,
    password: password,
    birthDay: birthDay,
    adresse: adresse,
  };

  const studentData = {
    inscriptionDate: new Date()
  };

  studentModel.addStudent(userData, studentData, (err, result) => {
    if (err) {
      console.error("Error adding student:", err);
      return res.render("pages/studentList", {
        error: "Database error. Could not add student.",
      });
    }

    res.redirect("studentList");
  });
};
