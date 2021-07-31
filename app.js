const express = require('express');

const app = express();

const port = 8070;

app.listen(port, () => {
    console.log('listening for request on port 8070');
});

app.get('/', (req, res) => {
    console.log('request made');
    res.send("home")
});

app.get('/about', (req, res) => {
    res.send("about")
});

app.get('/about-us', (req, res) => {
    res.send("about-us")   
});
