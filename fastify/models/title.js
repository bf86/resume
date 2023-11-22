const mysql = require(`${__dirname}/../db/mysql-local`);
const postgres = require(`${__dirname}/../db/postgres-local`);

module.exports.list = async function() {
  const result = await postgres.query('SELECT * FROM title');
  return result.rows;
};

module.exports.listMysql = async function(cb) {
  mysql.query('SELECT * FROM title', function (err, result) {
    if (err) {
      throw err;
    }
    cb(result);
  });
};

module.exports.show = async function(id) {
  const [title, company] = id.split('_');
  const result = await postgres.query(`
    SELECT
      *
    FROM
      title
    WHERE
      title = $1
      AND company = $2
  `, [title, company]);
  return result.rows[0];
};
