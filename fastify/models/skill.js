const db = require(`${__dirname}/../db/db-local`);

module.exports.list = async function() {
  const result = await db.query('SELECT * FROM skill');
  return result.rows;
};

module.exports.show = async function(name) {
  const result = await db.query('SELECT * FROM skill WHERE name = $1', [name]);
  return result.rows[0];
};

module.exports.listByType = async function() {
  const skillsByType = {};
  const typesResult = await db.query('SELECT * FROM skill_type')
  const skillsResult = await db.query('SELECT * FROM skill ORDER BY type, rank_in_type')

  typesResult.rows.forEach(addType);
  skillsResult.rows.forEach(assignToType);

  return Object.keys(skillsByType).map(formatResult);

  function addType(type) {
    skillsByType[type.name] = {
      detail: type.detail,
      skills: []
    }
  }

  function assignToType(skill) {
    console.log('assignToType');
    skillsByType[skill.type].skills.push(skill);
  }

  function formatResult(key) {
    console.log(key);
    return {
      name: key,
      skills: skillsByType[key].skills
    };
  }
};
