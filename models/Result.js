var mongoose = require('mongoose');

// schema
var resultSchema = mongoose.Schema({
  username:{type:String}, //누가
  subject:{type:String}, //어떤 과목을
  date:{type:Date}, //언제
  time:{type:Date}, //몇시에
  result:{type:String}, //출석했다
});

// model & export
var Result = mongoose.model('result', resultSchema);
module.exports = Result;