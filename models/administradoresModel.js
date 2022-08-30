var pool = require('./bd'); //llama a la base de datos
var md5 = require('md5'); //encripta la clave en la bd

async function getUserByUsernameAndPassword(user, password) {
    try {
        var query = 'select * from administradores where Username = ? and Password = ? limit 1';
        var rows = await pool.query(query, [user, md5(password)]);
        return rows[0];
    } catch (error) {
        console.log (error);
    }
}

module.exports = { getUserByUsernameAndPassword };