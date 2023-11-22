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
  Models
*/

const App = require(`${models}/app`);
const Education = require(`${models}/education`);
const Project = require(`${models}/project`);
const Recommendation = require(`${models}/recommendation`);
const Skill = require(`${models}/skill`);
const SkillType = require(`${models}/skillType`);
const Title = require(`${models}/title`);

/*
  Add-on
*/

fastify.register(require('@fastify/redis'), { url: 'redis://cache' });

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
  let { redis } = fastify;
  let redisRes = await redis.get('apps');
  if (!redisRes) {
    var dbRes = await App.list();
    await redis.set('apps', JSON.stringify(dbRes));
  }
  let res = redisRes || dbRes;
  corsReply(reply).send(res);
});

fastify.get('/api/pg/apps/:name', async function handler(request, reply) {
  let { name } = request.params;
  let res = await App.show(name);
  res = check404(res, name);
  corsReply(reply).send(res);
});

fastify.get('/api/pg/projects', async function handler(request, reply) {
  let res = await Project.list();
  corsReply(reply).send(res);
});

fastify.get('/api/pg/projects/:name', async function handler(request, reply) {
  let { name } = request.params;
  let res = await Project.show(name);
  res = check404(res, name);
  corsReply(reply).send(res);
});

fastify.get('/api/pg/skills', async function handler(request, reply) {
  let { redis } = fastify;
  let redisRes = await redis.get('skills');
  if (!redisRes) {
    var dbRes = await Skill.listByType();
    await redis.set('skills', JSON.stringify(dbRes));
  }
  let res = redisRes || dbRes;
  corsReply(reply).send(res);
});

fastify.get('/api/pg/skills/:name', async function handler(request, reply) {
  let { name } = request.params;
  let res = await Skill.show(name);
  res = check404(res, name);
  corsReply(reply).send(res);
});

fastify.get('/api/pg/skill-types', async function handler(request, reply) {
  let res = await SkillType.list();
  corsReply(reply).send(res);
});

fastify.get('/api/pg/skill-types/:name', async function handler(request, reply) {
  let { name } = request.params;
  let res = await SkillType.show(name);
  res = check404(res, name);
  corsReply(reply).send(res);
});

fastify.get('/api/pg/titles', async function handler(request, reply) {
  let res = await Title.list();
  corsReply(reply).send(res);
});

fastify.get('/api/pg/titles/:id', async function handler(request, reply) {
  let { id } = request.params;
  let res = await Title.show(id);
  res = check404(res, id);
  corsReply(reply).send(res);
});

fastify.get('/api/pg/education', async function handler(request, reply) {
  let res = await Education.list();
  corsReply(reply).send(res);
});

fastify.get('/api/pg/education/:institution', async function handler(request, reply) {
  let { institution } = request.params;
  let res = await Education.show(institution);
  res = check404(res, institution);
  corsReply(reply).send(res);
});

fastify.get('/api/pg/recommendations', async function handler(request, reply) {
  let res = await Recommendation.list();
  corsReply(reply).send(res);
});

fastify.get('/api/pg/faq', async function handler(request, reply) {
  let faq = require(`${models}/faq`);
  let res = await faq.list();
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
