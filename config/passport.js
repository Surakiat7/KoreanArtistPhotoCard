
var LocalStrategy = require('passport-local').Strategy;


var bcrypt = require('bcrypt-nodejs');


var database = require('../config/database');
var RunQuery = database.RunQuery;


module.exports = function (passport) {




    passport.serializeUser(function (user, done) {
        done(null, user.UserID);
    });


    passport.deserializeUser(function (userId, done) {
        var sqlStr = '\
            SELECT *\
            FROM users\
            where UserID = \'' + userId + '\'';
        RunQuery(sqlStr, function (rows) {
            done(null, rows[0]);
        });
    });


    passport.use('sign-in', new LocalStrategy({
            usernameField: 'username',
            passwordField: 'password',
            passReqToCallback: true 
        },
        function (req, username, password, done) { 
           
            var sqlStr = 'SELECT * FROM users WHERE Username = \'' + username + '\'';
            RunQuery(sqlStr, function (rows) {
              
                if (rows.length < 1)
                    return done(null, false, req.flash('signInError', 'No user found.'));

                if (!bcrypt.compareSync(password, rows[0].Password))
                    return done(null, false, req.flash('signInError', 'Oops! Wrong password.'));

                return done(null, rows[0]);
            });

        })
    );


    passport.use('sign-up', new LocalStrategy({
          
            usernameField: 'username',
            passwordField: 'password',
            passReqToCallback: true 
        },
        function (req, username, password, done) {

            var email = req.body.email;

            if (password != req.body.rePassword) {
                return done(null, false, req.flash('signUpError', 'Passwords do not match.'));
            }
            else {

                var selectQuery = 'SELECT *\
                    FROM users\
                    WHERE email = \'' + email + '\'';
                RunQuery(selectQuery, function (emailRows) {
                    if (emailRows.length > 0) {
                        return done(null, false, req.flash('signUpError', 'Email address has already been used.'));
                    }
                    else {
                        selectQuery = '\
                        SELECT *\
                        FROM users\
                        WHERE username = \'' + username + '\'';
                        RunQuery(selectQuery, function (usernameRows) {
                            if (usernameRows.length > 0) {
                                return done(null, false, req.flash('signUpError', 'Username has already been used.'));
                            }
                            else {
            
                                var fullName = req.body.fullName;
                                var phone = req.body.phone;
                                var address = req.body.streetAddress;
                                var postcode = req.body.postcode;
                                var city = req.body.city;
                                var country = req.body.country;
                                var passwordHash = bcrypt.hashSync(password, null, null);

                                var insertQuery = 'INSERT INTO Users\
                                    VALUES(null,\
                                    \'' + fullName + '\', \
                                    \'' + address + '\', \
                                    \'' + postcode + '\', \
                                    \'' + city + '\', \
                                    \'' + country + '\', \
                                    \'' + phone + '\', \
                                    \'' + email + '\', \
                                    \'' + username + '\', \
                                    \'' + passwordHash + '\', 0)';

                                RunQuery(insertQuery, function (insertResult) {

                                    var user = {
                                        UserID: insertResult.insertId
                                    };
                                    insertQuery = 'INSERT INTO Addresses\
                                    VALUES(null, ' +
                                        insertResult.insertId + ', \'' +
                                        fullName + '\', \'' +
                                        address + '\', \'' +
                                        postcode + '\', \'' +
                                        city + '\', \'' +
                                        country + '\', \'' +
                                        phone + '\')';
                                    RunQuery(insertQuery, function (addRow) {
                                        return done(null, user);
                                    });
                                });
                            }
                        });
                    }
                });
            }
        })
    );
};
