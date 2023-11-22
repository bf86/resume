const mysql = require(`${__dirname}/../db/mysql-local`);
const postgres = require(`${__dirname}/../db/postgres-local`);

module.exports.list = async function() {
  const result = await postgres.query('SELECT * FROM skill_type');
  return result.rows;
};

module.exports.listMysql = async function(cb) {
  mysql.query('SELECT * FROM skill_type', function (err, result) {
    if (err) {
      throw err;
    }
    cb(result);
  });
};

module.exports.show = async function(name) {
  const result = await postgres.query('SELECT * FROM skill_type WHERE name = $1', [name]);
  return result.rows[0];
};

module.exports.tree = async function(name) {
  const result = await postgres.query('SELECT name, NULL AS "type" FROM skill_type UNION SELECT name, type FROM skill');
  return result.rows[0];
};
