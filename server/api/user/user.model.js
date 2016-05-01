'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema,
    bcrypt   = require('bcrypt-nodejs');

var pRef = require('../../components/tools/pRef');

var UserSchema = new Schema({
    _staff_ : { type: Schema.Types.ObjectId, ref: 'Auth' },
    email : {
        type: String,
        unique: true,
        lowercase: true
    },
    password     : {
        type: String,
        select: false
    },
    resetToken: {
        type: String,
        default: ''
    },
    phone: { type: String, default: '' },
    bag: { type: String, default: '' },
    groupName: {
        type: String
    },
    accountType: {
        type: String,
        default: 'single'
    },
    tokenExpires: {
        type: Date,
        default: Date.now
    },
    prefix: String,
    name: String,
    suffix: String,
    firm: String,
    hasTag: Boolean,
    avatar: {
        type: String,
        default: 'https://s3-eu-west-1.amazonaws.com/nba-agc/user.png'
    },
    lastModified: {
        type: Date,
        default: Date.now
    },
    tagPrinted: {
        type: Boolean,
        default: false
    },
    _uploaded: { type: Boolean, default: false },
    _uploadTime: Date
});

// methods ======================
// Generate passwordReset token
UserSchema.statics.randomString = function(size) {
    size = size || 32;
    return pRef(size);
};

// generating a hash
UserSchema.methods.generateHash = function(password) {
    return bcrypt.hashSync(password, bcrypt.genSaltSync(8), null);
};

module.exports = mongoose.model('User', UserSchema);