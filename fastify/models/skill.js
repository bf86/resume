const mysql = require(`${__dirname}/../db/mysql-local`);
const postgres = require(`${__dirname}/../db/postgres-local`);

module.exports.list = async function() {
  const result = await postgres.query('SELECT * FROM skill');
  return result.rows;
};

module.exports.listMysql = async function(cb) {
  mysql.query('SELECT * FROM skill', function (err, result) {
    if (err) {
      throw err;
    }
    cb(result);
  });
};

module.exports.show = async function(name) {
  const result = await postgres.query('SELECT * FROM skill WHERE name = $1', [name]);
  return result.rows[0];
};

module.exports.listByType = async function() {
  const skillsByType = {};
  const typesResult = await postgres.query('SELECT * FROM skill_type')
  const skillsResult = await postgres.query('SELECT * FROM skill ORDER BY type, rank_in_type')

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

module.exports.listByTypeMysql = async function(cb) {
  const skillsByType = {};

  mysql.query('SELECT * FROM skill_type', function(typesResult) {
    mysql.query('SELECT * FROM skill ORDER BY type, rank_in_type', function(skillsResult) {
      typesResult.rows.forEach(addType);
      skillsResult.rows.forEach(assignToType);

      cb(Object.keys(skillsByType).map(formatResult));

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
    });
  });
};
