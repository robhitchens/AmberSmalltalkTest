var app = require('./the.js')('PlayingBackend');

exports.status = app('status');
exports.echo = app('echoEvent:andContext:');
