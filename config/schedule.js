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
                    console.log(new Date().getHours(), '시', new Date().getMinutes(), '분', new Date().getSeconds(), '초', 'scanning start!');
		    addon.scanBluetoothDevices()
                    schedule.scheduleJob({
			start: new Date(date),
                        end: endTime,
                        rule: '*/5 * * * *'
                    }, function () { // 5분마다 반복
                        console.log(new Date().getHours(), '시', new Date().getMinutes(), '분', new Date().getSeconds(), '초', 'an again!');
			addon.scanBluetoothDevices()
                    });
                })
            })
        }) // end of subjects.forEach
    }) // end of Subject.find
}

module.exports = scheduleSubjects;


