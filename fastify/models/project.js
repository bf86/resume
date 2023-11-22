const mysql = require(`${__dirname}/../db/mysql-local`);
const postgres = require(`${__dirname}/../db/postgres-local`);

module.exports.list = async function() {
  const result = await postgres.query(`
    SELECT name, description, role, organization FROM project
  `);
  return result.rows;
};

module.exports.listMysql = async function(cb) {
  mysql.query('SELECT name, description, role, organization FROM project', function (err, result) {
    if (err) {
      throw err;
    }
    cb(result);
  });
};

module.exports.show = async function(name) {
  console.log('project.module.exports.show');
  const result = await postgres.query(`
    SELECT name, description, role, organization FROM project WHERE name = $1
  `, [name]);
  return result.rows[0];
};
