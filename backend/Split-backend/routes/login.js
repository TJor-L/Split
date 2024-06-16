var express = require('express');
const passport = require('passport');
var router = express.Router();

router.get('/', function(req, res, next) {
    passport.authenticate('google', { scope: ['https://www.googleapis.com/auth/plus.login'] })(req, res, next);
});

module.exports = router;