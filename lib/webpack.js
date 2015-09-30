var path = require('path');
var spawn = require('child_process').spawn;
var SCRIPT = path.resolve(__dirname, '../scripts/linux/webpack.sh');

var build = function (appPath, cb) {
  var executable = 'sh';
  var args = [
    SCRIPT, appPath
  ];

  var options = { cwd: appPath };
  var webpack = spawn(executable, args, options);
  var stdout = "";
  var stderr = "";

  webpack.stdout.pipe(process.stdout, {end: false});
  webpack.stderr.pipe(process.stderr, {end: false});

  webpack.on('close', cb);
}

module.exports = build;
