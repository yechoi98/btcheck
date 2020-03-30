var express  = require('express');
var router = express.Router();
var util = require('../util');
var Subject = require('../models/Subject');
var Result = require('../models/Result');
var moment = require('moment');


router.get('/', util.isLoggedin, checkPermission ,function(req, res){
    Subject.find({})
      .exec(function(err, subjects){
        if(err) return res.json(err);     
        Result.find({})
        .exec(function(err, results){
          if(err) return res.json(err);
          res.render('users/table', {subjects:subjects, results:results, subjectSelect:null});   
        })
      });
  });
  
  router.post('/result', util.isLoggedin, checkPermission ,function(req, res){
    Subject.find({})
    .exec(function(err, subjects){
      if(err) return res.json(err);     
      Result.find({})
      .exec(function(err, results){
        if(err) return res.json(err);
        
        res.render('users/table', {subjects:subjects, results: results, subjectSelect:req.body.subjectSelect, moment});   
        console.log(subjects, results, req.body.subjectSelect)
        });  
      })
    });
 
  moment.locale('ko', {
    weekdays: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
    weekdaysShort: ["일","월","화","수","목","금","토"],
});



module.exports = router;

// private functions
function checkPermission(req, res, next){
  if(req.user.job != "student") return util.noPermission(req, res);
  next();
}
