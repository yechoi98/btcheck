var Subject = require('../models/Subject')
var Result = require('../models/Result')
var User = require('../models/User')
var Scan = require('../models/Scan')
var cron = require('cron')
const addon = require('../build/Release/native')

function scheduleSubjects() {
    Subject.find(function (err, subjects) {
        if (err) return console.log(err);
        subjects.forEach(function (subject) {
            subject.dates.forEach(function (date) {
                if(new Date(date)>= new Date()){
                scheduleJob(date, subject)
                   }
            }) // end of dates.forEach
        }) // end of subjects.forEach
    }) // end of Subject.find
}

function scheduleJob(date, subject) {
    const endTime = new Date(new Date(date).getTime() + (subject.duration + 1) * 60000);
    let min = 0
    const jobStart = new cron.CronJob({
        cronTime: new Date(new Date(date) - 1000),
        onTick: function () {
            job.start()
            console.log('schedule will be run after 1 second.')
        },
        start: true,
        timeZone: 'Asia/Seoul'
    })


    const job = new cron.CronJob({
        cronTime: '0 */5 * * * *',
        onTick: function () {
            console.log(new Date().toLocaleString())
            addon.scanBluetoothDevices()
            compareAndSave(date, subject, min)
            setTimeout(function() {
            restUsers(date, subject, min)
            min = min+5
            }, 5000);
        },
        start: false,
        timeZone: 'Asia/Seoul'

    })


    const jobEnd = new cron.CronJob({
        cronTime: endTime,
        onTick: function () {
            job.stop()
            console.log('schedule finished at', new Date().toLocaleString())
        },
        start: true,
        timeZone: 'Asia/Seoul'
    })
}

function compareAndSave(date, subject, min) {
    console.log('compareAndSave called\n', new Date)
    const startTime = new Date(new Date(date).getTime() + min * 60000)
    const endTime = new Date(startTime.getTime() + 60000)

    Scan.find(function (err, scans) {
            if (err) console.log(err)
            scans.forEach(function (scan) {
                    let scanTime = new Date(scan.time)
                    User.find({job:'student', subject:subject.subject},function (err, users) {
                            if (err) console.log(err)
                            users.forEach(function (user) {
                                if ((user.macAddress == scan.address) && ((startTime <= scanTime) && (endTime >= scanTime))) {
                                    Result.findOne({
                                        username: user.username,
                                        subject: subject.subject,
                                        date: date
                                    }, function (err, result) {
                                        if (err) console.log(err)
                                        if (result == null) {
                                            // create
                                            Result.create({
                                                name: user.name,
                                                username: user.username,
                                                subject: subject.subject,
                                                date: date,
                                                results: {
                                                    minutes: min,
                                                    time: scan.time,
                                                    result: "O"
                                                },
                                            }, function (err, result) {
                                                if (err) return console.log(err);
                                                console.log(result)
                                                console.log('first inserting result - O(create) end')
                                            })
                                        } 
                                        else {
                                            // update
                                            result.results.push({
                                                minutes: min,
                                                time: scan.time,
                                                result: "O"
                                            })
                                            result.save()
                                            console.log(result)
                                            console.log('first inserting result - O(update) end')

                                        } // else
                                    }) // Result.findOne
                                } // if
                            }) // users.forEach
                    }) // User.find
            }) // scans.forEach
    }) // Scan.find
} // function


function restUsers(date, subject, min){
    console.log('restUsers called\n', new Date())
  User.find({job:'student', subject:subject.subject},function(err, users){
    for(let i=0; i<users.length; i++){
      const user = users[i]
      Result.findOne({
	      username: user.username,
          subject: subject.subject,
          date: date
      }, function (err, result) {
          console.log(min)
        if (result == null) {
	
                                            // create
                                            Result.create({
                                                name: user.name,
                                                username: user.username,
                                                subject: subject.subject,
                                                date: date,
                                                results: {
                                                    minutes: min,
                                                    time: null,
                                                    result: "X"
                                                },
                                            }, function (err, result) {
                                                if (err) return res.json(err);
                                                console.log(result)
                                                console.log('second inserting result(create) - X end')
                                            })
	}
	else { 
		let isExist = false
		for(let i=0; i<result.results.length; i++){
		  if(result.results[i].minutes == min) {
              isExist = true
          }
		}
		if(isExist == false) {
		  // update
                                            result.results.push({
                                                minutes: min,
                                                time: null,
                                                result: "X"
                                            })
                                            result.save()
                                            console.log(result)
                                            console.log('second inserting result - X(update) end')

		
		}
        console.log(isExist)
	}
      
      })
    }
  })

}

module.exports = scheduleSubjects;
