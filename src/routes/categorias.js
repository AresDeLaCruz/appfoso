const express = require('express');
const router = express.Router();
const pool = require('../database');

router.get('/guardar',(req,res)=>{
    res.render('categorias/formcategoria');
});

router.post('/guardar',async(req,res)=>{
    console.log(req.body);
    const{nombre,descripcion}=req.body;
    //crear nuevo objeto
    const nuevacategoria={
        nombre,
        descripcion
    }
    //formular la sentencia sql
    await pool.query('insert into categorias set ?',
    [nuevacategoria]);
    res.redirect('/categorias/');
});

//peticion para consultar tabla categorias
router.get('/',async(req,res)=>{
    const categorias=await pool.query('select * from categorias');
    res.render('categorias/listacategorias',{categorias});
})

//Peticion para eliminar

router.get('/eliminar/:id',async(req,res)=>{
   /* console.log(req.params.id);
    res.send('Eliminado');*/
    const{id}=req.params;
    await pool.query('delete from categorias where id=?',[id]);
    res.redirect('/categorias/');
})

module.exports=router;