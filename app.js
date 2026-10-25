const express = require('express');
const app = express();
const PORT = 3000;

app.get('/', (req, res) => {
    res.send('The app.js is working');
});

app.listen(PORT, () => {
    console.log(`Server is listening at http://localhost:${PORT}`);
});