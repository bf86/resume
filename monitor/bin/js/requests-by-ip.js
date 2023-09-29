const { readLines } = require('ez-tools');
const { debuglog } = require('util');
const debuglogFunctions = debuglog('functions');

/*
  Print a lists of requests from a given IP
*/

async function requestsByIp(ip) {
  debuglogFunctions('requestsByIp');
  let logLines = await readLines('/var/log/nginx/access.log');
  let ipLines = logLines.filter(checkForIp);
  ipLines.forEach(line => console.log(line));

  function checkForIp(line) {
    return line.match(ip);
  }
}

if (!process.argv[2]) {
  console.error('usage: requests-by-ip.js [ip]');
  process.exit(1);
}

requestsByIp(process.argv[2])
  .catch(function(err) {
    console.error(err);
  });
