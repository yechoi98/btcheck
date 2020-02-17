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

function restUsers(results, users){
  users.forEach(function(user){
    results.forEach(function(result){
      if(user.username == result.username){
        break;
      }
      
    })

  })

}

Subject.find({})
  .exec(function(err, subjects){
    if(err) return res.json(err);     
    subjects.forEach(function(_subject){
      for(var i=0; i<_subject.dates.length; i++){
        var s =schedule.scheduleJob(_subject.dates[i], function(){
          exec("./test", function() { 
          var save=setInterval(saveResults(_subject.subject, _subject.dates[i]),1000) // scans로부터 출결 결과를 results에 저장
          var d=_subject.dates[i]
          d.setMinutes(d.getMinutes()+31) 
          schedule.scheduleJob(d, function(){ // c코드 실행 31분 후 스케줄
            clearInterval(save) // setInterval(saveResults,1000) 종료
            Result.find().all({subject:_subject.subject},{date:_subject.dates[i]}) 
              .exec(function(err, results){
                if(err) return res.json(err);
                User.find({subject:_subject.subject})
                .exec(function(err, users){
                  if(err) return res.json(err);
                  restUsers(results, users) // 30분 동안 스캔되지 않은 나머지 학생들을 결석시킴
                })
              })
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

