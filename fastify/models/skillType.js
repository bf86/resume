const db = require(`${__dirname}/../db/db-local`);

module.exports.list = async function() {
  const result = await db.query('SELECT * FROM skill_type');
  return result.rows;
};

module.exports.show = async function(name) {
  const result = await db.query('SELECT * FROM skill_type WHERE name = $1', [name]);
  return result.rows[0];
};
