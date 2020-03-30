var schedule = require('node-schedule');
var Subject = require('../models/Subject');
var User = require('../models/User');
var rule = new schedule.RecurrenceRule();


function scheduleSubjects(){

Subject.find(function(err, subjects){
    if(err) return res.json(err); 
    subjects.forEach(function(subject){
        subject.dates.forEach(function(date){
            let startTime = new Date(date);
            startTime.setMinutes(startTime.getMinutes()-5); // startTime에는 스케줄이 실행되지 않으므로 5분전에 스케줄을 등록함
            let endTime = new Date(date); 
            endTime.setMinutes(endTime.getMinutes()+subject.duration)// N분 후 스케줄 종료
            var j = schedule.scheduleJob({ start: startTime, end: endTime, rule: '*/5 * * * *' }, function(){ // 5분마다 반복
              console.log(new Date().getMinutes(), new Date().getSeconds());
            });
        })
    })
})

}

module.exports = scheduleSubjects;