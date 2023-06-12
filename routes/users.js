module.exports = function (app, passport) {

    app.get('/sign-in', function (req, res) {

        if (req.session.inCheckOut){
            var checkOutNoti = 'You need to sign in to check out!\
                Please sign up if you do not have one!';
            req.session.inCheckOut = false;
        }
        var contextDict = {
            title: 'Sign In',
            signInError: req.flash('signInError'),
            checkOutNoti: checkOutNoti
        };
        res.render('sign-in', contextDict);
    });

    app.post('/sign-in', passport.authenticate('sign-in', {
        successRedirect: '/usr/',
        failureRedirect: '/sign-in',
        failureFlash: true 
    }));

    app.get('/sign-up', function (req, res) {

        if (req.session.inCheckOut){
            var checkOutNoti = 'You need to sign in to check out!\
                Please sign up if you do not have one!';
            req.session.inCheckOut = false;
        }
        var contextDict = {
            title: 'Sign Up',
            signUpError: req.flash('signUpError'),
            checkOutNoti: checkOutNoti
        };

        res.render('sign-up', contextDict);
    });


    app.post('/sign-up', passport.authenticate('sign-up', {
        successRedirect: '/usr', 
        failureRedirect: '/sign-up',
        failureFlash: true
    }));

    app.get('/sign-out', function (req, res) {
        req.logout();
        res.redirect('/');
    });

    function isLoggedIn(req, res, next) {


        if (req.isAuthenticated())
            return next();


        res.redirect('/');
    }

};