var mongoose = require('mongoose');

// schema
var resultSchema = mongoose.Schema({
  name:{type:String},
  username:{type:String}, 
  subject:{type:String},
  date:{type:Date}, 
  results:[{minutes: Number, time:Date, result:String}]
});

// model & export
var Result = mongoose.model('result', resultSchema);
module.exports = Result;
