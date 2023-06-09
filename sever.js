const express = require('express');

// create new express app and save it as "app"
const app = express();

// server configuration
const PORT = 4042;

// create a route for the app
app.get('/hello', (req, res) => {
  res.send('Hello World');
});

app.get('/api', (req, res) => {
  res.send('world is good');
});

// make the server listen to requests
app.listen(PORT, () => {
  console.log(`Server running at:${PORT}/`);
});