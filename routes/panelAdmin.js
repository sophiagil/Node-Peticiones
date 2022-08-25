var express = require('express');
var router = express.Router();

router.get('/', function (req, res, next) {
    res.render('admin/panelAdmin', {
    Username: req.session.nombre,
    });
});

module.express =router;
