/*
  Lib
*/

const fastify = require('fastify')({ logger: true });
const corsReply = require(`${__dirname}/helpers/corsReply`);

/*
  Config
*/

const fixtures = `${__dirname}/fixtures`;
const models = `${__dirname}/models`;

/*
  Endpoints
*/

fastify.get('/api/pg/apps', async function handler(request, reply) {
  let App = require(`${models}/app`);
  let apps = await App.list();
  corsReply(reply).send(apps);
});

fastify.get('/api/pg/projects', async function handler(request, reply) {
  let Project = require(`${models}/project`);
  let projects = await Project.list();
  corsReply(reply).send(projects);
});

fastify.get('/api/pg/skills', async function handler(request, reply) {
  let Skill = require(`${models}/skill`);
  let skills = await Skill.list();
  corsReply(reply).send(skills);
});

fastify.get('/api/pg/skill-types', async function handler(request, reply) {
  let SkillType = require(`${models}/skillType`);
  let skillTypes = await SkillType.list();
  corsReply(reply).send(skillTypes);
});

fastify.get('/api/pg/titles', async function handler(request, reply) {
  let Title = require(`${models}/title`);
  let titles = await Title.list();
  corsReply(reply).send(titles);
});

fastify.get('/api/pg/education', async function handler(request, reply) {
  let Education = require(`${models}/education`);
  let education = await Education.list();
  corsReply(reply).send(education);
});

/*
  Server
*/

fastify.listen({ port: 80, host: '0.0.0.0' }, (err) => {
  if (err) {
    fastify.log.error(err)
    process.exit(1)
  }
});
