const db = require(`${__dirname}/../db/db-local`);

module.exports.list = async function() {
  const result = await db.query('SELECT * FROM title');
  return result.rows;
};

module.exports.show = async function(id) {
  const [title, company] = id.split('_');
  const result = await db.query(`
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
