const { mapBy, readLines, shell } = require('ez-tools');
const { debuglog } = require('util');
const debuglogFunctions = debuglog('functions');
const db = require(`${__dirname}/db-production.js`);

/*
  Firewall reject all IPs that have been assessed as data theft attempt
*/

async function blockDataAttempts() {
  debuglogFunctions('blockDataAttempts');
  let sql = 'SELECT ip FROM ip WHERE data_attempt = TRUE';
  let result = await db.query(sql);
  let dataAttemptIps = mapBy(result.rows, 'ip');
  let dataAttemptRanges = dataAttemptIps.map(ip => `${ip}/32`);
  let rejectString = dataAttemptIps.sort().join(',');
  let blockCommand = `gcloud compute --project=${process.env.RESUME_PROJECT_ID} `;
      blockCommand += 'firewall-rules update no-hackers ';
      blockCommand += `--source-ranges=${rejectString}`;
  await shell(blockCommand);
  db.end();
  console.log('cya');
}

blockDataAttempts();
