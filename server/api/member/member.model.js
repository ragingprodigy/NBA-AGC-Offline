'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var MemberSchema = new Schema({
  name: String,
  nbaId: String,
  yearCalled: String
});

module.exports = mongoose.model('Member', MemberSchema);