const express=require('express');
const pool = require('../database');
const router = express.Router();
const passport=require('passport')

router.get('/',(req,res)=>{
    res.render('home'); 
});

router.get('/acerca',(req,res)=>{
  res.render('acerca');
})
router.get('/unidad1',(req,res)=>{
  res.render('unidad1')
})
router.get('/unidad2',(req,res)=>{
  res.render('unidad2')
})

router.get('/consejos',(req,res)=>{
  res.render('consejos')
})

router.get('/signup',(req,res)=>{
    res.render('formlogin');
})

/*router.post("/signup",async(req,res)=>{
    console.log(req.body);
    const username= req.body.username;
    const password=req.body.password;
    const resultado =await pool.query('select * from usuarios where username= ? and password= ?',[username,password]);
    console.log(resultado);
    if(username=="admin" && password=='123'){
        res.redirect('/categorias');
    }if(resultado!=''){
        if(resultado[0].username==username && resultado[0].password==password){
            res.redirect('preguntas/vistaUsuario');
        }
    }else{
        res.render('./formlogin')
    }
});*/

router.post('/login', passport.authenticate('local', {
    successRedirect: '/redirect',
    failureRedirect: '/login',
  }));
  
  router.get('/redirect', (req, res) => {
    
    if (req.isAuthenticated()) {
     
      if (req.user.username == 'admin') {
        res.redirect('/categorias');
      } else {
        
        res.redirect('/preguntas/vistaUsuario');
      }
    } else {
    
      res.redirect('/login');
    }
  });
router.get('/registro',(req,res)=>{
    res.render('registro');
})

router.get('/logout', function(req, res, next) {
  req.logout(function(err) {
    if (err) { return next(err); }
    res.redirect('/');
  });
});
module.exports=router;
