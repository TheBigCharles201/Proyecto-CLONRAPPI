const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const logger = require('morgan');
const cors = require('cors');
 
/*
 RUTAS
*/
const users = require('./routes/userRoutes');

 
const port = process.env.PORT || 3000;
 
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));
app.use(cors());
 
app.disable('x-powered-by');
app.set('port', port);

//LLAMANDO A LAS RUTAS DEL SERVER
users(app);
 
server.listen(3000, '192.168.100.9' || 'localhost', function(){
    console.log('Aplicacion de Nodejs para la APP Reciclando en el puerto: '+ port +' iniciando...')
});
 
 
// ERROR HANDLER
app.use((err, req, res, next) => {
    console.log(err);
    res.status(err.sttus || 500).send(err.stack);
});

module.exports = {
    app: app,
    server: server
}

