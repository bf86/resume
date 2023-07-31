const db = require(`${__dirname}/../db/db-local`);

module.exports.list = async function() {
  const result = await db.query('SELECT * FROM skill');
  const rows = result.rows;
  return rows;
};
