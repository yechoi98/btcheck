var mongoose = require('mongoose');

// schema
var scanSchema = mongoose.Schema({
  address:{type:String},
  time:{type:Date},
});

// model & export
var Scan = mongoose.model('scan', scanSchema);
module.exports = Scan;