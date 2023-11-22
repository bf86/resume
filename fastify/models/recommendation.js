const mysql = require(`${__dirname}/../db/mysql-local`);
const postgres = require(`${__dirname}/../db/postgres-local`);

module.exports.list = async function() {
  const result = await postgres.query('SELECT * FROM recommendation');
  return result.rows;
};

module.exports.listMysql = async function(cb) {
  mysql.query('SELECT * FROM recommendation', function (err, result) {
    if (err) {
      throw err;
    }
    cb(result);
  });
};
