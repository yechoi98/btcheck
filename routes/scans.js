var express  = require('express');
var router = express.Router();
var Scan = require('../models/Scan');
var User = require('../models/User');
var util = require('../util');

// Index
router.get('/', util.isLoggedin, checkPermission ,function(req, res){
  Scan.find({})
    .sort({address:1})
    .exec(function(err, scans){
      if(err) return res.json(err);
      User.find({})
     .sort({username:1})
     .exec(function(err, users){
      if(err) return res.json(err);
      res.render('professor/datatable', {users:users, scans:scans});
      });
    });
});

// New
router.get('/new', function(req, res){
  res.render('posts/new');
});

// create
router.post('/', function(req, res){
  Post.create(req.body, function(err, post){
    if(err) return res.json(err);
    res.redirect('/posts');
  });
});

// show
router.get('/:id', function(req, res){
  Post.findOne({_id:req.params.id}, function(err, post){
    if(err) return res.json(err);
    res.render('posts/show', {post:post});
  });
});

// edit
router.get('/:id/edit', function(req, res){
  Post.findOne({_id:req.params.id}, function(err, post){
    if(err) return res.json(err);
    res.render('posts/edit', {post:post});
  });
});

// update
router.put('/:id', function(req, res){
  req.body.updatedAt = Date.now();
  Post.findOneAndUpdate({_id:req.params.id}, req.body, function(err, post){
    if(err) return res.json(err);
    res.redirect("/posts/"+req.params.id);
  });
});

// destroy
router.delete('/:id', function(req, res){
  Post.deleteOne({_id:req.params.id}, function(err){
    if(err) return res.json(err);
    res.redirect('/posts');
  });
});

module.exports = router;

// private functions
function checkPermission(req, res, next){
  if(req.user.job != "professor") return util.noPermission(req, res);
  next();
}
