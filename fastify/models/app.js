const db = require(`${__dirname}/../db/db-local`);

module.exports.list = async function() {
  const result = await db.query('SELECT * FROM app');
  return result.rows;
};

module.exports.show = async function(name) {
  console.log('app.module.exports.show');
  const result = await db.query('SELECT * FROM app WHERE name = $1', [name]);
  return result.rows[0];
};
