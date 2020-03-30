var Result = require('./models/Result')
var Subject = require('./models/Subject')

function test(){
Result.findOne({date:{"$gte": new Date(2020, 4, 16), "$lt": new Date(2020, 8, 18)}}, function(err, result){
    if(err) console.log(err)
    console.log(result)})
}

module.exports = test
