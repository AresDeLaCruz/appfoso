const express = require('express');
const morgan = require('morgan');
const { engine } = require('express-handlebars');
const path = require('path');
const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const session = require('express-session');
const SQLiteStore = require('connect-sqlite3')(session);
const pool = require('./database');
const sqlite3 = require('sqlite3').verbose();

const app = express();
const db = new sqlite3.Database('database.db');

app.set('port', process.env.PORT || 4000);
app.set('views', path.join(__dirname, 'views'));
app.engine('.hbs', engine({
  defaultLayout: 'main',
  layoutsDir: path.join(app.get('views'), 'layouts'),
  partialsDir: path.join(app.get('views'), 'partials'),
  extname: 'hbs',
  helpers: require('./lib/handlebars')
}));
app.set('view engine', '.hbs');

app.use(morgan('dev'));
app.use(express.urlencoded({ extended: true }));

app.use(express.static(path.join(__dirname, 'public')));

app.use(session({
  store: new SQLiteStore({ db: 'sessions_db' }),
  secret: 'secret_key',
  resave: false,
  saveUninitialized: false,
}));

app.use(passport.initialize());
app.use(passport.session());


passport.use(new LocalStrategy(
    async function(username, password, done) {
      try {
        const resultado = await pool.query('SELECT * FROM usuarios WHERE username = ?', [username]);
        if (resultado.length > 0) {
          if (resultado[0].username === username && resultado[0].password === password) {
            return done(null, resultado[0]);
          } else {
            return done(null, false, { message: 'Contraseña incorrecta.' });
          }
        } else {
          return done(null, false, { message: 'Usuario no encontrado.' });
        }
      } catch (err) {
        console.error('Error en la consulta:', err);
        return done(err);
      }
    }
  ));
  
  

  passport.serializeUser(function(user, cb) {
    cb(null, { id: user.id, username: user.username });
  });
  
  passport.deserializeUser(async function(user, cb) {
    try {
      
      const [result] = await pool.query('SELECT * FROM usuarios WHERE id = ?', [user.id]);
      if (result) {
        cb(null, result); 
      } else {
        cb(new Error('Usuario no encontrado.'));
      }
    } catch (err) {
      console.error('Error en la consulta:', err);
      cb(err);
    }
  });
  


app.use((req, res, next) => {
  res.locals.user = req.user;
  next();
});
app.use((req, res, next) => {
    res.locals.isAuthenticated = req.isAuthenticated();
    res.locals.username = req.user ? req.user.username : null; 
    res.locals.nombre = req.user ? req.user.nombre : null; 
    res.locals.apellido = req.user ? req.user.apellido : null; 
    res.locals.grupo = req.user ? req.user.grupo : null; 

    

    next();
  });
  
// Rutas
app.use(require('./routes/index'));
app.use('/categorias', require('./routes/categorias'));
app.use('/preguntas', require('./routes/preguntas'));
app.use('/usuarios', require('./routes/usuarios'));

app.listen(app.get('port'), () => {
  console.log('Server running on port:', app.get('port'));
});