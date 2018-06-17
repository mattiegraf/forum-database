const express = require('express');
var mysql = require('mysql');

const app = express();
const port = process.env.PORT || 5000;

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'password',
  database : 'boboverse',
  port : 3306,
  multipleStatements : true
});

app.get('/api/hello', (req, res) => {
  res.send({ express: 'Hello From Express' });
});

app.get('/clicked', (req, res) => {
  connection.query("select * from account", (err, rows) => {
    if (err) throw err;
    res.send(rows)
  });
});

app.listen(port, () => console.log(`Listening on port ${port}`));