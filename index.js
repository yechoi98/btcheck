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
var Scan = require('./models/Scan')
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
function saveResults(subject, compareTime){

}

Subject.find({})
  .exec(function(err, subjects){
    if(err) return res.json(err);     
    subjects.forEach(function(subject){
      for(let i=0; i<subject.dates.length; i++){
        var s =schedule.scheduleJob(subject.dates[i], function(){
          exec("./test", function() { 
          var save=setInterval(saveResults(subject.subject, subject.dates[i]),3000) // scans로부터 출결 결과를 results에 저장
          var d=subject.dates[i]
          d.setMinutes(d.getMinutes()+30) // setInterval 종료 시각 : scanning 시작 30분 후
          schedule.scheduleJob(d, function(){clearInterval(save)}) // results 저장 종료 
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

