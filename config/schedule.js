var Subject = require('../models/Subject');
var cron = require('cron');
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
// 수업 시간은 5의 �수 
	
    const jobTrigger = new cron.CronJob({
	    cronTime: new Date(new Date(date)-1000),
	    onTick: function(){
	    job.start()
            console.log('schedule will be run after 1 second.')
	    },
	    start: true,
	    timeZone: 'Asia/Seoul'
    })


   const job = new cron.CronJob({
	   cronTime: '0 */5 * * * *',
	   onTick: function(){
           console.log(new Date())
	   addon.scanBluetoothDevices()
	   },
	   start: false,
	   timeZone: 'Asia/Seoul'

   })
}


module.exports = scheduleSubjects;


