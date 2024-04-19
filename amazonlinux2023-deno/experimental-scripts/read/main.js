// deno run --allow-read=/tmp  main.js
import fs from 'node:fs';

fs.readdir("/root/", (err, files) => {
  files.forEach(file => {
    console.log(file);
  });
});
