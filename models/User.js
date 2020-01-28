var mongoose = require('mongoose');

// schema
var userSchema = mongoose.Schema({
  studentID: {
    type: String,
    required: [true, '입력하세요!'],
    match: [/^[0-9]*$/, '학번을 입력하세요!'],
    trim: true,
    unique: true,
    maxlength: 8
  },
  password: {
    type: String,
    required: [true, '입력하세요!'],
    match: [/(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/, ' 숫자와 특수문자 1개 이상, 영문 2개 이상 사용하여 8자리 이상 입력하세요!'],
    select: false,
    trim: true,
    minlength: 8
  },
  name: {
    type: String,
    required: [true, '입력하세요!']
  },
  job: {
    type: String,
    required: [tue, '입력하세요!']
  },
  subject: {
    type: String
  },
  address: {
    type: String,
    required: [tue, '입력하세요!'],
    match: [/^([0-9a-fA-F][0-9a-fA-F]:){5}.[0-9a-fA-F]$/, ' ab:00:cd:00:ef:00의 형태로 입력하세요!'],
    trim: true
  },
}, {
  toObject: {
    virtuals: true
  }
});

// virtuals
userSchema.virtual('passwordConfirmation')
  .get(function () {
    return this._passwordConfirmation;
  })
  .set(function (value) {
    this._passwordConfirmation = value;
  });

userSchema.virtual('originalPassword')
  .get(function () {
    return this._originalPassword;
  })
  .set(function (value) {
    this._originalPassword = value;
  });

userSchema.virtual('currentPassword')
  .get(function () {
    return this._currentPassword;
  })
  .set(function (value) {
    this._currentPassword = value;
  });

userSchema.virtual('newPassword')
  .get(function () {
    return this._newPassword;
  })
  .set(function (value) {
    this._newPassword = value;
  });

// password validation
userSchema.path('password').validate(function (v) {
  var user = this;

  // create user
  if (user.isNew) {
    if (!user.passwordConfirmation) {
      user.invalidate('passwordConfirmation', 'Password Confirmation is required.');
    }

    if (user.password !== user.passwordConfirmation) {
      user.invalidate('passwordConfirmation', 'Password Confirmation does not matched!');
    }
  }

  // update user
  if (!user.isNew) {
    if (!user.currentPassword) {
      user.invalidate('currentPassword', 'Current Password is required!');
    } else if (user.currentPassword != user.originalPassword) {
      user.invalidate('currentPassword', 'Current Password is invalid!');
    }

    if (user.newPassword !== user.passwordConfirmation) {
      user.invalidate('passwordConfirmation', 'Password Confirmation does not matched!');
    }
  }
});

// model & export
var User = mongoose.model('user', userSchema);
module.exports = User;