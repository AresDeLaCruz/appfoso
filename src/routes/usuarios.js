const express = require('express');
const router = express.Router();
const pool = require('../database');

router.post('/registro',async(req,res)=>{
    const{nombre,apellido,grupo,username,password}=req.body;
    const estatus=1;
    const fecha=new Date();
    const fechaRegisto=fecha.toLocaleDateString('es-mx');
    const nuevoUsuario={
        nombre,
        apellido,
        grupo,
        username,
        password,
        estatus,
        fechaRegisto,
    }
    console.log(nuevoUsuario);
    await pool.query('insert into usuarios set ?',[nuevoUsuario]);
    res.render('./formlogin');
})


module.exports=router;
