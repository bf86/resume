/*
  Allow React front-end to request from Fastify back-end
*/

module.exports = function corsReply(reply) {
  return reply.header('Access-Control-Allow-Origin', 'http://localhost:3000')
};
