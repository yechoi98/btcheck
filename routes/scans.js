var express  = require('express');
var router = express.Router();
var util = require('../util');
var Subject = require('../models/Subject');
var Result = require('../models/Result');


router.get('/', util.isLoggedin, checkPermission ,function(req, res){
  Subject.find({})
    .exec(function(err, subjects){
      if(err) return res.json(err);     
      Result.find({})
      .exec(function(err, results){
        if(err) return res.json(err);
        res.render('professor/datatable', {subjects:subjects, results:results});   
      })
    });
});


module.exports = router;

// private functions
function checkPermission(req, res, next){
  if(req.user.job != "professor") return util.noPermission(req, res);
  next();
}
