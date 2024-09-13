const mysql = require('mysql');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',      
  password: '123',     
  database: 'jssmartquiz' 
});

connection.connect((err) => {
  if (err) {
    console.error('Error connecting to the database:', err);
  } else {
    console.log('Database connected successfully!');
  }
});

module.exports = connection;
