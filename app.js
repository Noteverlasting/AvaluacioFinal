// Dependencias del servidor
const path = require('node:path');
const express = require('express');
const app = express();

// Indicar puerto cargando el .env mediante process
process.loadEnvFile()
const PORT = process.env.PORT || 3030;

// Indicar ruta de los ficheros estáticos
app.use(express.static(path.join(__dirname, "public")))

// Lanzar respuesta -> index.html
app.get('/', (req, res) => {
    res.sendFile('index.html')
})

// Indicar Puerto de escucha
app.listen(PORT, () => {console.log(`Servidor escuchando en http://localhost:${PORT}`)})