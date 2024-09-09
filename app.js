const express = require("express");
const path = require('path');
app.set('vigit ew engine','ejs');
app.set('views',path.join(__dirname,'views'));

app.use(express.json());
app.use(express.urlencoded({ extended:true}));
app.use(express.static(path.join(__dirname,'public')));

const UserRouter = require('./routes/UserRouter')

const port = process.env.port || 3000;
app.listen(port, ()=>{
    console.log(`server run on port ${port}`)
});