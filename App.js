const express = require('express');
const app = express();
const port = 3000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const user = {
    name: 'Boss',
    age: 30,
    email: 'boss@gmail.com',
}

app.get('/', (req, res) => {
  res.send(user);
});
app.listen(port, () => {
  console.log(`Le serveur ecoute sur le port http://localhost:${port}`);
});