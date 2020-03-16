var Subject = require('../models/Subject')
var Result = require('../models/Result')
var User = require('../models/User')
var Scan = require('../models/Scan')
var cron = require('cron')
const addon = require('../build/Release/native')

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
	
    const jobStart = new cron.CronJob({
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
           console.log(new Date().toLocaleString())
	   addon.scanBluetoothDevices()
           compareAndSave(date, subject)
	   },
	   start: false,
	   timeZone: 'Asia/Seoul'

   })

   var endTime = new Date(new Date(date).getTime() + (subject.duration+1)*60000);
   
   const jobEnd = new cron.CronJob({
	    cronTime: endTime,
	    onTick: function(){
	    job.stop()
            console.log('schedule finished at', new Date().toLocaleString())
	    },
	    start: true,
	    timeZone: 'Asia/Seoul'
    })
}

function compareAndSave(date, subject){

User.find(function(err, _users){
if (err) return res.json(err)
let users = _users
Scan.find(function(err, _scans){
if (err) return res.json(err)
let scans=_scans
scans.forEach(function(scan){
  users.forEach(function(user){
     const startTime = new Date(date)
     const scanTime = new Date(scan.time)
     const endTime = new Date(new Date(startTime).getTime()+subject.duration*60000)
    if((user.job == 'student') && (user.macAddress == scan.address) && ((startTime <= scanTime) && (endTime >= scanTime)) ) { // if MAC address matches and scanned time is between class start time and class end time.
	    saveResult(date, subject, user, scan) 
    }
  })
})	
})
})
}

function saveResult(_date, subject, user, scan){
  Result.findOne({username:user.username, date:_date}, function(err, result){
  if(err) res.json(err)
  let i = 0
  let startTime, endTime
   for( ; i <= subject.duration; i=i+5) {
     startTime = new Date(new Date(_date).getTime() + i*60000) 
     endTime = new Date(new Date(startTime).getTime()+1*60000)
     if( (scan.time>=startTime)&&(scan.time<endTime) ){
       if(result==null){
      // create result 
      Result.create({
                  name: user.name,
                  username:user.username, 
                  subject:subject.subject,
                  date:_date,
                  results:{minutes:i, time:scan.time, result:"O"}, 
                }, function(err, result){
                  if(err) return res.json(err);
       })
      break
      }
      else {
        result.results.push({minutes:i, time:scan.time, result:"O"})
	result.save()
        break
      }
     }
   }
  })
}

module.exports = scheduleSubjects;


