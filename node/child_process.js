#!/usr/bin/env node
var name = process.argv[2];
var exec = require('child_process').exec;

var child = exec('echo hello ' + name, function(err, stdout, stderr) {
      if (err) throw err;
        console.log(stdout);
});

var child = exec('node ./util.js', function(err, stdout, stderr) {
      if (err) throw err;
        console.log(stdout);
});
console.log( "code end" ); 
