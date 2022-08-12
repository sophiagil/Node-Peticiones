var express = require('express');
var router = express.Router();

router.get('/', function (req, res, next) {
    res.render('admin/panelAdmin', {
        login: 'admin/login',
        Username: req.session.nombre,
    });
});

module.express =router;
