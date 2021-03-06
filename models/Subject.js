var mongoose = require('mongoose');

// schema
var subjectSchema = mongoose.Schema({
  subject:{type:String},
  dates:[Date],
  duration: {type:Number},
  professor:{type:String},
});

// model & export
var Subject = mongoose.model('subject', subjectSchema);
module.exports = Subject;