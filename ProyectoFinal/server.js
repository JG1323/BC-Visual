const express = require('express');
const bodyParser = require('body-parser');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');

const app = express();
const port = 3000;

app.use(bodyParser.json());

// Clave secreta para JWT
const secretKey = 'mysecretkey';

// Usuarios simulados
let users = [];

// Middleware para proteger rutas
const authenticateToken = (req, res, next) => {
    const token = req.headers['authorization'];
    if (!token) return res.sendStatus(403);
    
    jwt.verify(token, secretKey, (err, user) => {
        if (err) return res.sendStatus(403);
        req.user = user;
        next();
    });
};

// Ruta de registro de usuarios
app.post('/register', async (req, res) => {
    const { username, password } = req.body;
    const hashedPassword = await bcrypt.hash(password, 10);
    users.push({ username, password: hashedPassword });
    res.status(201).send('User registered');
});

// Ruta de login
app.post('/login', async (req, res) => {
    const { username, password } = req.body;
    const user = users.find(user => user.username === username);
    if (!user) return res.status(400).send('User not found');

    const validPassword = await bcrypt.compare(password, user.password);
    if (!validPassword) return res.status(400).send('Invalid password');

    const token = jwt.sign({ username: user.username }, secretKey, { expiresIn: '1h' });
    res.json({ token });
});

// Ruta protegida
app.get('/protected', authenticateToken, (req, res) => {
    res.send('This is a protected route');
});

app.listen(port, () => {
    console.log(`Server running on http://localhost:${port}`);
});