var express = require('express');
var mongoose = require('mongoose');
var schedule = require('node-schedule');
var bodyParser = require('body-parser');
var methodOverride = require('method-override');
var flash = require('connect-flash');
var session = require('express-session');
var passport = require('./config/passport');
var Subject = require('./models/Subject');
var User = require('./models/User');
var Scan = require('./models/Scan');
var Result = require('./models/Result')
var exec = require('child_process').exec;
var app = express();

// DB setting
mongoose.set('useNewUrlParser', true);
mongoose.set('useFindAndModify', false);
mongoose.set('useCreateIndex', true);
mongoose.set('useUnifiedTopology', true);
mongoose.connect(process.env.MONGO_DB, {dbName: 'btcheck'});
var db = mongoose.connection;
db.once('open', function(){
  console.log('DB connected');
});
db.on('error', function(err){
  console.log('DB ERROR : ', err);
});

// Other settings
app.set('view engine', 'ejs');
app.use(express.static(__dirname+'/public'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));
app.use(methodOverride('_method'));
app.use(flash());
app.use(session({secret:'MySecret', resave:true, saveUninitialized:true}));

// Passport
app.use(passport.initialize());
app.use(passport.session());

// Scheduling
function saveResults(_subject, compareTime){
  var tmp = compareTime;
  var inTime = tmp.setMinutes(tmp.getMinutes()+20); // 출석 인정
  var lateTime = tmp.setMinutes(tmp.getMinutes()+30); // 지각 인정
  User.find().all([{subject:_subject},{job:"student"}])
  .exec(function(err, users){
    if(err) return res.json(err);
    Scan.find({})
      .exec(function(err, scans){
        if(err) return res.json(err);
        scans.forEach(function(scan){
          users.forEach(function(user){
            if(user.macAddress == scan.address){
              if(scan.time<compareTime) break; // 다음 scan 검사
              else if(scan.time<=inTime){ // 출석
                Result.create({
                  name: user.name,
                  username:user.username, 
                  subject:_subject,
                  date:compareTime,
                  time:scan.time, 
                  result:"출석",
                }, function(err, result){
                  if(err) return res.json(err);
                  console.log(result);
                });
              }
              else if(scan.time<=lateTime){ // 지각
                Result.create({
                  name: user.name,
                  username:user.username, 
                  subject:_subject,
                  date:compareTime,
                  time:scan.time, 
                  result:"지각",
                }, function(err, result){
                  if(err) return res.json(err);
                  console.log(result);
                });
              }
              else { // 결석
                Result.create({
                  name: user.name,
                  username:user.username, 
                  subject:_subject,
                  date:compareTime,
                  time:scan.time, 
                  result:"결석",
                }, function(err, result){
                  if(err) return res.json(err);
                  console.log(result);
                });
              }
            }
          })
        })
      })
  });

  
}

Subject.find({})
  .exec(function(err, subjects){
    if(err) return res.json(err);     
    subjects.forEach(function(subject){
      for(var i=0; i<subject.dates.length; i++){
        var s =schedule.scheduleJob(subject.dates[i], function(){
          exec("./test", function() { 
          var save=setInterval(saveResults(subject.subject, subject.dates[i]),3000) // scans로부터 출결 결과를 results에 저장
          var d=subject.dates[i]
          d.setMinutes(d.getMinutes()+30) // setInterval 종료 시각 : scanning 시작 30분 후
          schedule.scheduleJob(d, function(){
            clearInterval(save)
            restUsers()
          }) 
          });  
        })
      }
    })
  })


// Custom Middlewares
app.use(function(req,res,next){
  res.locals.isAuthenticated = req.isAuthenticated();
  res.locals.currentUser = req.user;
  next();
});

// Routes
app.use('/', require('./routes/home'));
app.use('/datatable', require('./routes/scans'));
app.use('/users', require('./routes/users'));

// Port setting
var port = 3000;
app.listen(port, function(){
  console.log('server on! http://localhost:'+port);
});

