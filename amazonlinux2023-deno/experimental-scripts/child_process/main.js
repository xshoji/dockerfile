// deno run --allow-read=/tmp --allow-env --allow-run=/bin/sh main.js
import r from 'node:child_process';

r.exec('ls -al /mactmp',
  function (error, stdout, stderr) {
    console.log('stdout: ' + stdout);
    console.log('stderr: ' + stderr);
    if (error !== null) {
      console.log('exec error: ' + error);
    }
  }
);
