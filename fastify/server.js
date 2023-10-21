/*
  Lib
*/

const fastify = require('fastify')({ logger: true });
const corsReply = require(`${__dirname}/helpers/corsReply`);

/*
  Config
*/

const models = `${__dirname}/models`;

/*
  Endpoints
*/

function check404(res, id) {
  return res || {
    message:`Record ${id} not found`,
    error:'Not Found',
    statusCode:404
  };
}

fastify.get('/api/pg/apps', async function handler(request, reply) {
  let App = require(`${models}/app`);
  let res = await App.list();
  corsReply(reply).send(res);
});

fastify.get('/api/pg/apps/:name', async function handler(request, reply) {
  let { name } = request.params;
  let App = require(`${models}/app`);
  let res = await App.show(name);
  res = check404(res, name);
  corsReply(reply).send(res);
});

fastify.get('/api/pg/projects', async function handler(request, reply) {
  let Project = require(`${models}/project`);
  let res = await Project.list();
  corsReply(reply).send(res);
});

fastify.get('/api/pg/projects/:name', async function handler(request, reply) {
  let { name } = request.params;
  let Project = require(`${models}/project`);
  let res = await Project.show(name);
  res = check404(res, name);
  corsReply(reply).send(res);
});

fastify.get('/api/pg/skills', async function handler(request, reply) {
  let Skill = require(`${models}/skill`);
  let res = await Skill.listByType();
  corsReply(reply).send(res);
});

fastify.get('/api/pg/skills/:name', async function handler(request, reply) {
  let { name } = request.params;
  let Skill = require(`${models}/skill`);
  let res = await Skill.show(name);
  res = check404(res, name);
  corsReply(reply).send(res);
});

fastify.get('/api/pg/skill-types', async function handler(request, reply) {
  let SkillType = require(`${models}/skillType`);
  let res = await SkillType.list();
  corsReply(reply).send(res);
});

fastify.get('/api/pg/skill-types/:name', async function handler(request, reply) {
  let { name } = request.params;
  let SkillType = require(`${models}/skillType`);
  let res = await SkillType.show(name);
  res = check404(res, name);
  corsReply(reply).send(res);
});

fastify.get('/api/pg/titles', async function handler(request, reply) {
  let Title = require(`${models}/title`);
  let res = await Title.list();
  corsReply(reply).send(res);
});

fastify.get('/api/pg/titles/:id', async function handler(request, reply) {
  let { id } = request.params;
  let Title = require(`${models}/title`);
  let res = await Title.show(id);
  res = check404(res, id);
  corsReply(reply).send(res);
});

fastify.get('/api/pg/education', async function handler(request, reply) {
  let Education = require(`${models}/education`);
  let res = await Education.list();
  corsReply(reply).send(res);
});

fastify.get('/api/pg/education/:institution', async function handler(request, reply) {
  let { institution } = request.params;
  let Education = require(`${models}/education`);
  let res = await Education.show(institution);
  res = check404(res, institution);
  corsReply(reply).send(res);
});

fastify.get('/api/pg/recommendations', async function handler(request, reply) {
  let recommendation = require(`${models}/recommendation`);
  let res = await recommendation.list();
  corsReply(reply).send(res);
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
