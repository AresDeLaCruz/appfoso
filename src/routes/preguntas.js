const express = require('express');
const router = express.Router();
const pool = require('../database');
const moment = require('moment');

router.get('/eliminar/:id',async(req,res)=>{
    const{id}=req.params;
    await pool.query('delete from reactivos where id= ?',[id]);
    res.redirect('/preguntas/');
})


router.get('/',async(req,res)=>{
    const reactivos = await pool.query('select * from reactivos');
    res.render('preguntas/listapreguntas',{reactivos});
});

router.get('/guardar',async(req,res)=>{
    const categorias=await pool.query('select * from categorias');
    res.render('preguntas/formpreguntas',{categorias})
});

router.post('/guardar',async(req,res)=>{
    console.log(req.body);
    const{nombre,opcion_1,opcion_2,opcion_3,correcta,idCategoria}=req.body;
    const nuevaPregunta={
        nombre,
        opcion_1,
        opcion_2,
        opcion_3,
        correcta,
        idCategoria
    };
    await pool.query('insert into reactivos set ?',[nuevaPregunta]);
    res.redirect('/preguntas/');
})

router.get('/vistaUsuario', async (req, res) => {
    const data = await pool.query('select * from reactivos ');
    const categorias = await pool.query('select * from categorias');

    res.render('test/cuestionario', {data, categorias});
  });



  router.post('/califica', async (req, res) => {
    
    // Obtener los IDs de las preguntas contestadas
  const preguntaIds = Object.keys(req.body)
  .filter((key) => key.startsWith('reactivos'))
  .map((key) => key.replace('reactivos', ''));

// Consultar solo las preguntas contestadas desde la base de datos
const [data, categorias] = await Promise.all([
  pool.query('SELECT * FROM reactivos WHERE id IN (?)', [preguntaIds]),
  pool.query('SELECT * FROM categorias'),
]);

    const respuestasFormulario = req.body;
    let calificacion = 0;
    let resultados=[];// Array para almacenar los resultados de cada pregunta
    
    data.forEach((pregunta) => {
      const idPregunta = pregunta.id;
      const respuestaCorrecta = pregunta.correcta;
      const respuestaSeleccionada = respuestasFormulario[`reactivos${idPregunta}`];
      
      const resultadoPregunta = {
        pregunta: pregunta.nombre,
        respuestaUsuario: respuestaSeleccionada,
        respuestaCorrecta: respuestaCorrecta,
        esCorrecta: respuestaSeleccionada === respuestaCorrecta
      };
  
      if (respuestaSeleccionada === respuestaCorrecta) {
        calificacion++;
      }
     
      resultados.push(resultadoPregunta);
    });
    
     // Obtener el nombre de usuario desde la variable de sesión
    const username = req.user.username;
     // Consultar la base de datos para obtener el ID del usuario utilizando el nombre de usuario
     const usuario = await pool.query('SELECT id FROM USUARIOS WHERE username = ?', [username]);

   
  // Verificar si el usuario existe y obtener su ID
  let usuarioId = null;
  if (usuario.length > 0) {
    usuarioId = usuario[0].id;
  }

  // Insertar la calificación en la tabla de calificaciones
 
  const calificacionNumerica = parseInt(calificacion, 10);

  // Calcular si se aprobó o reprobó
  const aprobado = calificacionNumerica >= 8;


  const fechaActual = moment().format('YYYY-MM-DD');
  await pool.query('INSERT INTO calificaciones (usuario_id, calificacion, fecha) VALUES (?, ?, ?)', [usuarioId, calificacion, fechaActual]);
  res.render('preguntas/calificaciones', { calificacion: calificacionNumerica, resultados, data, aprobado });
});
  
  
router.post('/consultar', async(req,res)=>{
  const categoria = req.body.categoria
  console.log(categoria)
  res.send("categoria consultada")
})

router.get('/materia/:id', async(req,res)=>{
  const materia = req.params.id
  const data = await pool.query(`SELECT * FROM reactivos WHERE idCategoria = ${materia} ORDER BY RAND() LIMIT 10`);
  res.render('test/cuestionarioDos', {data, materia});
})

module.exports = router;
module.exports=router;
