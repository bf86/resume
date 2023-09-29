const { readLines } = require('ez-tools');
const { debuglog } = require('util');
const debuglogFunctions = debuglog('functions');

module.exports = async function requestsByIp(ip) {
  debuglogFunctions('requestsByIp');
  let logLines = await readLines(`${__dirname}/../../log/access.log`);
  let ipLines = logLines.filter(checkForIp);
  return ipLines;

  function checkForIp(line) {
    return line.match(ip);
  }
};
