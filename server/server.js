/* ---------- IMPORTS ------------------------------------------------------- */

var path = require("path");
var express = require("express");
var app = express();
var constants = require("./constants.js");

// This an npm module which includes references to a lot of templating engines
var templatingEngines = require('consolidate');

/* ---------- CONFIGURATION ------------------------------------------------- */

app.configure(function(){
    app.use(express.bodyParser());
    app.use(express.static(path.join(__dirname, "/static")));

    // assign the handlebars templating engine to handle html files
    app.engine('html', templatingEngines.handlebars);

    app.set('view engine', 'html'); // set .html as the default extension
    app.set('views', path.join(__dirname, 'templates')); // set view dir

    app.set("port", process.env.PORT || 7000);
});

/* ---------- ROUTES -------------------------------------------------------- */

// Home Route
app.get('/', function(req, res) {
    res.render('index.html', {
        derp: "foo"
    });
});

/* ---------- RUN SERVER ---------------------------------------------------- */

app.listen(app.get("port"));
console.log("Listening on " + app.get("port"));