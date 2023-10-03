const db = require(`${__dirname}/../db/db-local`);

module.exports.list = async function() {
  const result = await db.query(`
    SELECT name, description, role, organization FROM project
  `);
  return result.rows;
};

module.exports.show = async function(name) {
  console.log('project.module.exports.show');
  const result = await db.query(`
    SELECT name, description, role, organization FROM project WHERE name = $1
  `, [name]);
  return result.rows[0];
};
