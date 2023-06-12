var express = require('express');
var router = express.Router();


var database = require('../config/database');
var RunQuery = database.RunQuery;


router.all('/', function (req, res, next) {
    var sqlStr = '\
        SELECT *\
        FROM Categories';

    RunQuery(sqlStr, function (categories) {
        sqlStr = '\
            SELECT Products.*, Categories.CategoryName, Categories.CategorySlug\
            FROM Products\
            INNER JOIN Categories\
            ON Products.CategoryID = Categories.CategoryID';

        RunQuery(sqlStr, function (products) {
            var contextDict = {
                currentUrl: '/',
                title: 'Home',
                categories: categories,
                featProducts: products,
                customer: req.user
            };

 
            res.render('index', contextDict);
        });
    });
});


router.route('/cat/')
    .all(function (req, res, next) {
        var sqlStr = '\
        SELECT *\
        FROM Categories';

        RunQuery(sqlStr, function (categories) {
            var contextDict = {
                currentUrl: '/cat',
                title: 'Categories',
                categories: categories,
                customer: req.user
            };

            res.render('categories', contextDict);
        });
    });


router.route('/cat/:catSlug')
    .all(function (req, res, next) {
        if (req.params.catSlug == "all") {
            var selectQuery = '\
                SELECT Products.*, Categories.CategoryName, Categories.CategorySlug\
                FROM Products\
                INNER JOIN Categories\
                ON Products.CategoryID = Categories.CategoryID';

            RunQuery(selectQuery, function (products) {

                selectQuery = '\
                SELECT *\
                FROM Categories';

                RunQuery(selectQuery, function (categories) {

                    var contextDict = {
                        title: 'All products',
                        products: products,
                        categories: categories,
                        customer: req.user
                    };

                    res.render('categoryProducts', contextDict);
                });
            });
        }
        else {
            var sqlStr = '\
                SELECT Products.*, Categories.CategoryName, Categories.CategorySlug\
                FROM Products\
                INNER JOIN Categories\
                ON Products.CategoryID = Categories.CategoryID\
                WHERE Categories.CategorySlug = \'' + req.params.catSlug + '\'';

            RunQuery(sqlStr, function (products) {

                sqlStr = '\
                SELECT *\
                FROM Categories';

                RunQuery(sqlStr, function (categories) {

                    var contextDict = {
                        title: products[0].CategoryName,
                        products: products,
                        categories: categories,
                        customer: req.user
                    };

                    res.render('categoryProducts', contextDict);
                });
            });
        }
    });


router.route('/cat/:catSlug/:prodSlug')
    .all(function (req, res, next) {
        var sqlStr = '\
        SELECT *\
        FROM Products\
        WHERE ProductSlug = \'' + req.params.prodSlug + '\'';

        RunQuery(sqlStr, function (product) {

            var contextDict = {
                title: product[0].ProductName,
                product: product[0],
                customer: req.user
            };

            res.render('productDetail', contextDict);
        });
    });

module.exports = router;
