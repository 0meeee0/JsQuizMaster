CREATE DATABASE smartexam;
use smartexam ;
create TABLE users(
    id_user int AUTO_INCREMENT PRIMARY KEY,
    firstName varchar(255),
	name varchar(255),
    email varchar(255),
	password varchar(255),
    role enum('foramateur','etudiant','admine')
);
CREATE TABLE formateurs(
	id_formateur int AUTO_INCREMENT PRIMARY KEY,
    id_user int,
    FOREIGN KEY id_user REFERENCES users(id_user),
    birthDay date,
    adresse varchar(255),
    specialty varchar(255));
CREATE TABLE etudiant(
	id_etudiant int AUTO_INCREMENT PRIMARY KEY,
    id_user int,
     FOREIGN KEY id_user REFERENCES users(id_user),
    birthDay date,
    adresse varchar(255),
    inscriptionDate date 
    
);

CREATE table quiz(
	id_quiz int AUTO_INCREMENT PRIMARY KEY,
    score int,
    answerVisibilty boolean,
    chances int,
    feedback varchar(255)
);

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

create table niveaux(
	id_niveaux int AUTO_INCREMENT PRIMARY key,
    descriotion varchar(255),
	valeusMin int,
    valeursMax int 
);


create table questions (
	id_question int AUTO_INCREMENT PRIMARY KEY,
    questionText text,
    image blob,
    video blob,
    point int,
    id_niveaux int not null,
    FOREIGN KEY (id_niveaux) REFERENCES niveaux(id_niveaux) on DELETE CASCADE
);

create TABLE answer(
	id_answer int AUTO_INCREMENT PRIMARY key,
    id_question int,
    FOREIGN KEY (id_question) REFERENCES questions(id_question) ON DELETE CASCADE,
    answerText text 
);

