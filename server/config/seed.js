/**
 * Populate DB with sample data on server start
 * to disable, edit config/environment/index.js, and set `seedDB: false`
 */

'use strict';

var User = require('../api/auth/auth.model');

User.count({}, function(e, count){
    if (count < 1) {
        // Create Default Admin User

        var user = new User();
        user.name = 'OMONAYAJO OLADAPO ADEOLA';
        user.email = 'o.omonayajo@gmail.com';
        user.password = user.generateHash('secret_key');
        user.role = 'admin';

        user.save();
    }
});