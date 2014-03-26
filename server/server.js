/* ---------- IMPORTS ------------------------------------------------------- */

var path = require("path");
var express = require("express");
var app = express();
var constants = require("./constants.js");
var fs = require("fs");

// This an npm module which includes references to a lot of templating engines
var templatingEngines = require("consolidate");

/* ---------- CONFIGURATION ------------------------------------------------- */

app.configure(function(){
    app.use(express.bodyParser());
    app.use(express.static(path.join(__dirname, "/static")));

    // assign the swig templating engine to handle html files
    app.engine("html", templatingEngines.swig);

    app.set("view engine", "html"); // set .html as the default extension
    app.set("views", path.join(__dirname, "templates")); // set view dir

    app.set("port", process.env.PORT || 7000);
});

/* ---------- ROUTES -------------------------------------------------------- */

// Home Route
app.get("/", function(req, res) {
    getDossier(1, function(err, dossier){
        console.log(dossier.basics.name);
        res.render("index.html", dossier.basics.name);
    });
});

app.get("/dossier", function(req, res){
    res.render("dossier.html", dossiers.dossier1);
});


function getDossier(num, callback){
    fs.readFile("dossier" + num + ".json", function(err, data) {
        if(err){
            callback(err)
        } else {
            try {
                var obj = JSON.parse(data);
                callback(undefined, obj);
            } catch(e) {
                callback(e);
                return; 
            }
        }
    });
}

/* ---------- RUN SERVER ---------------------------------------------------- */

app.listen(app.get("port"));
console.log("Listening on " + app.get("port"));

/* ---------- UTILS --------------------------------------------------------- */