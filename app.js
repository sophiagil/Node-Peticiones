var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

require('dotenv').config();
var pool= require('./models/db');
var session = require('express-session');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var loginRouter = require('./routes/admin/login');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use(session({
  secret: 'claveejemplo333',
  resave: false,
  saveUninitialized: true
}));

app.use('/', indexRouter);
app.use('/users', usersRouter);

//Select

//pool.query('select * from administradores').then(function (resultados) {
//  console.log(resultados)
//});

//Insert

//var obj = {
  //Nombres: 'Sofia',
  //Apellidos: 'Gil',
  //Edad: 37,
  //Puesto: 'Gerente',
  //Rol: 'Administrador Web',
  //Mail: 'sophiagil84@gmail.com',
  //Celular: '114443333',
  //Direccion: 'Av. 6 S/N',
  //CP: '5282',
  //Pais_Residencia: 'Argentina',
  //Estado_Activo: '1'
//};

//pool.query('insert into administradores set ?', [obj]).then(function (resultados) {
  //console.log(resultados)
//});

// update

//var id= 5;
//var obj= {
  //Nombres:'Leandro',
  //Apellidos: 'Remon',
  //Edad: '44',
  //Puesto: 'Gerente de Ventas',
  //Rol: 'Ejecutivo de cuentas',
  //Mail: 'leandroremon@gmail.com',
  //Celular: '113332222',
  //Direccion: 'Av. 6 S/N',
  //CP: 5282,
  //Pais_Residencia: 'Argentina',
  //Estado_Activo: 1
//};

//pool.query('update administradores set ? where id_admin= ?', [obj, id]).then (function (resultados) {
  //console.log(resultados)
//});

// delete

//var id= 2;
//pool.query('delete from administradores where id_admin= ?', [id]).then(function (resultados) {
  //console.log(resultados)
//});

// update 2

//var id= 5;
//var obj= {
  //Nombres:'Leandro',
  //Apellidos: 'Remon',
  //Edad: '44',
  //Puesto: 'Gerente de Marketing',
  //Rol: 'Marketing Digital',
  //Mail: 'leandroremon@gmail.com',
  //Celular: '113332222',
  //Direccion: 'Av. 6 S/N',
  //CP: '5282',
  //Pais_Residencia: 'Argentina',
  //Estado_Activo: '1'
//};

//pool.query('update administradores set ? where id_admin= ?', [obj, id]).then (function (resultados) {
  //console.log(resultados)
//});

// Funciones

app.get('/', function (req, res) {
  var conocido = Boolean(req.session.nombre);

  res.render('index', {
    title: 'Sesiones en Express.js',
    conocido: conocido,
    nombre: req.session.nombre
  });
});

app.post('/ingresar', function
  (req, res) {
  if (req.body.nombre) {
    req.session.nombre = req.body.nombre
  }
  res.redirect('/');
});

app.get('/salir', function (req, res) {
  req.session.destroy();
  res.redirect('/');
});

//app.use('/users', usersRouter);
app.use('./admin/login', loginRouter);

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
