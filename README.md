# Leak Detector HiFiPrototype
A high fidelity prototype for the Leak Detector utility.

## Introduction
There are two main components to this prototype, a native __mac status bar app__
(created with RubyMotion) and a simple __web app__ (created with node and
express). These components have __separate__ installation and run practices,
which will be documented below. In order to fully "run" this prototype, you'll
need to do the following, in the order specified:

1. Install the web app
2. Run the web app
3. Install RubyMotion
4. Run the status bar app

_However_, if you don't want to install RubyMotion you can run the web app as
standalone to simulate a status bar app experience. You won't be able to click
on a fancy icon in the status bar, but you'll be able to basically see what
that'll look like. More on this later.

## Install the web app
The web app is a standard node server using express. To install, do the
following:
```bash
cd server
npm install
```
This should install all the server's required dependencies.

## Run the web app
In the `server` directory (if you're not already there), run the following:
```base
node server.js
```

If you've opted to run the app in standalone mode, please continue directly to
the [standalone mode]() section. If not, continue to installing RubyMotion.

## Install Ruby Motion
The status bar app is developed using [RubyMotion](http://www.rubymotion.com/),
so you'll need to purchase and install it in order to build and run the app
yourself.

_Don't want to install RubyMotion? Consider running the web app in [standalone
mode]()._

## Running the status bar app
Once you have RubyMotion installed, run the following:
```bash
cd DossierProto
rake
```

This should build and run the status bar app. __This may take a LONG time
the first time you do it.__ After it's done, you should see the app pop up in
your status bar.

## Standalone Mode
More on this in a bit
