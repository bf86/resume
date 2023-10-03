const db = require(`${__dirname}/../db/db-local`);

module.exports.list = async function() {
  const result = await db.query('SELECT * FROM education');
  return result.rows;
};

module.exports.show = async function(institution) {
  const result = await db.query('SELECT * FROM education WHERE institution = $1', [institution]);
  return result.rows[0];
};
