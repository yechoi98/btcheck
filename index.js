var express = require('express');
var mongoose = require('mongoose');
var bodyParser = require('body-parser');
var methodOverride = require('method-override');
var flash = require('connect-flash');
var session = require('express-session');
var passport = require('./config/passport');
var schedule = require('./config/schedule');
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

// Scheduleing
//schedule();

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

// Custom Middlewares
app.use(function(req,res,next){
  res.locals.isAuthenticated = req.isAuthenticated();
  res.locals.currentUser = req.user;
  next();
});


// Routes
app.use('/', require('./routes/home'));
app.use('/datatable', require('./routes/scans'));
app.use('/table', require('./routes/scan'));
app.use('/users', require('./routes/users'));
app.use('/table', require('./routes/scan'));



// Port setting
var port = 30000;
app.listen(port, function(){
  console.log('server on! http://localhost:'+port);
});


process.on('SIGTERM', function(err){
server.close()
})
