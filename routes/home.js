var express = require('express');
var router = express.Router();

// Home
router.get('/', function(req, res){
  res.render('home');
});


// Login
router.get('/login', function (req,res) {
  var username = req.flash('username')[0];
  var errors = req.flash('errors')[0] || {};
  res.render('login', {
    username:username,
    errors:errors
  });
});

// Mac Address Information
router.get('/macinfo', function(req, res){
  res.render('macinfo');
});


// Forgot Password
router.get('/forgot-password', function(req, res){
  res.render('forgot-password');
});


module.exports = router;
