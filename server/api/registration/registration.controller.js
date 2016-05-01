'use strict';

var _ = require('lodash');
var Registration = require('./registration.model'),
    User = require('../user/user.model'),
    Bag = require('../bag/bag.model'),
    request = require('request'),
    moment = require('moment');

var ObjectId = require('mongoose').Types.ObjectId;

// Get list of registrations
exports.index = function(req, res) {
  Registration.find(req.query).sort({lastModified: -1}).exec(function (err, registrations) {
    if(err) { return handleError(res, err); }
    return res.json(200, registrations);
  });
};

// Get a single registration
exports.show = function(req, res) {
  Registration.findById(req.params.id, function (err, registration) {
    if(err) { return handleError(res, err); }
    if(!registration) { return res.send(404); }
    return res.json(registration);
  });
};

exports.stats = function(req, res) {
    var d = new Date(),
        month = d.getMonth(),
        year = d.getFullYear(),
        day = d.getDate();

    Registration.aggregate([
        { $match: {
            _staff_: new ObjectId(req.user),
            lastModified: { $gt: new Date(year+','+month+','+day) }
        }},
        { $group: {
            _id: "$_staff_",
            amount: { $sum: "$conferenceFee" },
            count: {$sum:1}
        }}
    ], function(err, data){
        Registration.aggregate([
            { $match: {
                _staff_: new ObjectId(req.user)
            }},
            { $group: {
                _id: "$_staff_",
                amountAll: { $sum: "$conferenceFee" },
                countAll: {$sum:1}
            }}
        ], function(err, allData){
            return res.json(_.merge(data[0], allData[0]));
        });
    });
};

// Creates a new registration in the DB.
exports.create = function(req, res) {

    req.body.regCode = 'OS-'+Registration.pRef(5);
    req.body.bankDatePaid = new Date();
    req.body.bankDeposit = req.body.conferenceFee;
    req.body.bankBranch = 'ON-SITE PAYMENT';

  Registration.create(req.body, function(err, registration) {

    if(err) { return handleError(res, err); }

      // Create User Account
      var username = 'on-'+(registration.firstName + registration.surname).split(' ').join('').toLowerCase();

      // Find Existing User
      User.find({email: username}, function (err, existingUsers) {

          if (existingUsers.length) {
              username += '_'+existingUsers.length;
          }

          var newPass = '123456';

          var user = new User();

          user.email = username;
          user._staff_ = registration._staff_;
          user.name = registration.tag.name;
          user.phone = registration.mobile;
          user.prefix = registration.tag.prefix;
          user.suffix = registration.tag.suffix;
          user.firm = registration.tag.company;
          user.bag = req.body.bag;
          user.hasTag = true;
          user.password = user.generateHash(newPass);

          user.save(function() {
              // Decrement the bag count
              Bag.update({ name: user.bag }, { $inc: { quantity: -1 } }, function(err) {
                  if (err) { return handleError(res, err); }

                  registration.user = user;

                  registration.save(function ( ) {
                      return res.status(201).json(user);
                  });
              });

          });
      });
  });
};

function handleError(res, err) {
    console.log(err);
  return res.send(500, err);
}