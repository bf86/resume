const { readLines } = require('ez-tools');
const { debuglog } = require('util');
const debuglogFunctions = debuglog('functions');
const db = require(`${__dirname}/db-local.js`);

/*
  Record all IPs that have requested from server
  Yes, there are existing tools to do this better
  But it seemed like a worthwhile exercise to create my own
*/

async function recordIps() {
  let transactions = {};
  debuglogFunctions('recordIps');
  let logLines = await readLines('/var/log/nginx/access.log');
  await logLines.forEach(recordLine);
  exitWhenFinished();

  async function recordLine(line) {
    debuglogFunctions('recordLine');
    if (!line) {
      return;
    }
    let segmentOne = line.split(' - ')[0];
    let match = segmentOne.match(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/);
    let ip = match ? match[0] : null;
    if (!ip) {
      return;
    }
    let dataAttempt = line.match(/\.env/)
      || line.match(/XDEBUG_SESSION_START/)
      ? true : null;
    transactions[ip] = 'pending';
    let sql = `
      INSERT INTO
        ip (ip, data_attempt)
      VALUES
        ($1, $2)
      ON CONFLICT
        (ip)
      DO UPDATE SET
        data_attempt = ($2 OR ip.data_attempt);
    `;
    await db.query(sql, [ip, dataAttempt])
      .catch(function(err) {
        debuglogFunctions('queryCatch');
        console.error(err);
      })
      .finally(function() {
        debuglogFunctions('queryFinally');
        transactions[ip] = 'complete';
      });
  }

  function exitWhenFinished() {
    debuglogFunctions('exitWhenFinished');
    if (nonePending()) {
      return db.end();
    }
    setTimeout(exitWhenFinished, 1000);
  }

  function nonePending() {
    debuglogFunctions('nonePending');
    return !Object.values(transactions).includes('pending');
  }
};

recordIps()
  .catch(function(err) {
    console.error(err);
  });
