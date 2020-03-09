var schedule = require('node-schedule');
var Subject = require('../models/Subject');
var User = require('../models/User');
const addon = require('../build/Release/native');

function scheduleSubjects() {
    Subject.find(function (err, subjects) {
        if (err) return res.json(err);
        subjects.forEach(function (subject) {
            subject.dates.forEach(function (date) {
                let endTime = new Date(date);
                endTime.setMinutes(endTime.getMinutes() + subject.duration) // 수업 시간 끝나면 스케줄 종료
                schedule.scheduleJob(date, function () {
                  console.log('hihihihi')
                })
            })
        }) // end of subjects.forEach
    }) // end of Subject.find
}

module.exports = scheduleSubjects;