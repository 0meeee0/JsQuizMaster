const express = require('express');
const app = express();
const port = 3000
const path = require('path');
const userRoutes= require('./routes/UserRouter')
app.use(express.static(path.join(__dirname, 'public')));

app.set('view engine', 'ejs')

app.use('/', userRoutes);


app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
