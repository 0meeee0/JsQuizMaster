-- Create the database and use it
CREATE DATABASE jssmartquiz;
USE jssmartquiz;

-- Users table
CREATE TABLE users (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(255),
    name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255),
    role ENUM('formateur', 'etudiant', 'admin')
);

-- Formateurs table
CREATE TABLE formateurs (
    id_formateur INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT,
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    birthDay DATE,
    adresse VARCHAR(255),
    specialty VARCHAR(255)
);

-- Etudiant table
CREATE TABLE etudiant (
    id_etudiant INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT,
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    birthDay DATE,
    adresse VARCHAR(255),
    inscriptionDate DATE
);

-- Quiz table
CREATE TABLE quiz (
    id_quiz INT AUTO_INCREMENT PRIMARY KEY,
    score INT,
    answerVisibility BOOLEAN,
    chances INT,
    feedback VARCHAR(255)
);

-- Etudiant_Quiz table
CREATE TABLE etudiant_quiz (
    id_etudiant INT,
    id_quiz INT,
    attempt_number INT NOT NULL,
    score_obtained INT NOT NULL,
    final_result BOOLEAN,
    PRIMARY KEY (id_etudiant, id_quiz),
    FOREIGN KEY (id_etudiant) REFERENCES etudiant(id_etudiant) ON DELETE CASCADE,
    FOREIGN KEY (id_quiz) REFERENCES quiz(id_quiz) ON DELETE CASCADE
);

-- Niveaux table
CREATE TABLE niveaux (
    id_niveaux INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255),
    valeurMin INT,
    valeurMax INT
);

-- Sujets table
CREATE TABLE sujets (
    id_sujet INT AUTO_INCREMENT PRIMARY KEY,
    intitule VARCHAR(255) NOT NULL
);

-- Sous_sujets table
CREATE TABLE sous_sujets (
    id_sous_sujet INT AUTO_INCREMENT PRIMARY KEY,
    intitule VARCHAR(255) NOT NULL,
    id_sujet INT,
    FOREIGN KEY (id_sujet) REFERENCES sujets(id_sujet) ON DELETE CASCADE
);

-- Questions table
CREATE TABLE questions (
    id_question INT AUTO_INCREMENT PRIMARY KEY,
    questionText TEXT,
    image BLOB,
    video BLOB,
    point INT,
    id_niveaux INT NOT NULL,
    id_sujet INT,
    FOREIGN KEY (id_niveaux) REFERENCES niveaux(id_niveaux) ON DELETE CASCADE,
    FOREIGN KEY (id_sujet) REFERENCES sujets(id_sujet) ON DELETE CASCADE
);

-- Answer table
CREATE TABLE answer (
    id_answer INT AUTO_INCREMENT PRIMARY KEY,
    id_question INT,
    FOREIGN KEY (id_question) REFERENCES questions(id_question) ON DELETE CASCADE,
    answerText TEXT
);
