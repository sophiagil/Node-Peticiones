var express = require('express');
var router = express.Router();
var administradoresModel = require('./../../models/administradoresModel');

/* GET login. */
router.get('/', function(req, res, next) {
  res.render('admin/login',{
  });
});

/* Ruteo y método POST */

router.post('/', async (req, res, next) => {
try {
    var Username = req.body.Username;    //captura de información en BD
    var Password = req.body.Password;

    var data = await administradoresModel.getUserByUsernameAndPassword(Username, Password); 
    //verifica datos y redirecciona
    //Username: mail del usuario
    //Password: 1234

    if (data != undefined) {
      req.session.id_admin = data.id;
      req.session.nombre = data.Nombre;
      res.redirect('./../admin/panelAdmin'); 
    } else {
      res.render('admin/login', {
        error: true
      });
    }
  } catch (error) {
  console.log(error);
  }
});

/* Logout */

router.get('/logout',function (req, res, next) {
  req.session.destroy();
  res.render('admin/login', {
  });
});


module.exports = router;

