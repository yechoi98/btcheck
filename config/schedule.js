var Subject = require('../models/Subject');
var cron = require('node-cron');
var User = require('../models/User');
const addon = require('../build/Release/native');

function scheduleSubjects() {
    Subject.find(function (err, subjects) {
        if (err) return res.json(err);
        subjects.forEach(function (subject) {
            subject.dates.forEach(function (date) {
		    scheduleJob(date, subject)
            }) // end of dates.forEach
        }) // end of subjects.forEach
    }) // end of Subject.find
}

function scheduleJob(date, subject){

                   let endTime = new Date(date)
	           endTime.setMinutes(endTime.getMinutes() + subject.duration) 
		    addon.scanBluetoothDevices()
}


module.exports = scheduleSubjects;


