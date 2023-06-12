var express = require('express');

var path = require('path');

var favicon = require('serve-favicon');
var morgan = require('morgan');


var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var csrf = require('csrf');
var session = require('express-session');
var passport = require('passport');
var flash = require('connect-flash');

var app = express();


app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');
app.locals.pretty = true;


app.use(favicon(path.join(__dirname, 'public', '/img/ico/favicon.ico')));
app.use(morgan('dev'));

var csrfProtection = csrf({ cookie: true });

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(session({ secret: 'anhpham1509', saveUninitialized: true, resave: true }));
require('./config/passport')(passport);
app.use(passport.initialize());
app.use(passport.session());
app.use(flash());


var routes = require('./routes/routes');
var users = require('./routes/users')(app, passport);
var products = require('./routes/cart');
var checkout = require('./routes/checkout');
var admin = require('./routes/admin');
var profile = require('./routes/profile');


app.use('/', routes);
app.use('/cart', products);
app.use('/checkout', checkout);
app.use('/admin', admin);
app.use('/usr', profile);


app.use(function(req, res, next){
    var err = req.session.error,
        msg = req.session.notice,
        success = req.session.success;

    delete req.session.error;
    delete req.session.success;
    delete req.session.notice;

    if (err) res.locals.error = err;
    if (msg) res.locals.notice = msg;
    if (success) res.locals.success = success;

    next();
});



app.use(function (req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});


if (app.get('env') === 'development') {
    app.use(function (err, req, res, next) {
        res.status(err.status || 500);
        res.render('error', {
            message: err.message,
            error: err
        });
    });
}


app.use(function (err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
        message: err.message,
        error: {}
    });
});

module.exports = app;
