/*
  Allow React front-end to request from Fastify back-end
*/

module.exports = function corsReply(reply) {
  if (process.env.PRODUCTION) {
    return reply.header('Access-Control-Allow-Origin', 'https://brian86.dev');
  }
  return reply.header('Access-Control-Allow-Origin', 'http://localhost:3000');
};
