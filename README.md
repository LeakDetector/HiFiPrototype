# Leak Detector HiFiPrototype
A high fidelity prototype for the Leak Detector utility.

__NOTE: Large portions of this are no logner valid after the server was split
out into a separate repo. Will update documentation soon__

## Introduction
There are two main components to this prototype, a native __mac status bar app__
(created with RubyMotion) and a simple __web app__ (created with node and
express). These components have __separate__ installation and run practices,
which will be documented below. In order to fully "run" this prototype, you'll
need to do the following, in the order specified:

1. [Install the web app](#install-the-web-app)
2. [Run the web app](#run-the-web-app)
3. [Install RubyMotion](#install-rubymotion)
4. [Run the status bar app](#run-the-status-bar-app)

_However_, if you don't want to install RubyMotion you can at least see what the
status bar app would look like by running the web app in "standalone" mode. All
this does is add some styling to the web app to make it look as though it's a
mac status bar app. For instructions on how to do this see the
[standalone](#standalone-mode) section.

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
the [standalone mode](#standalone-mode) section. If not, continue to installing
RubyMotion.

## Install RubyMotion
The status bar app is developed using [RubyMotion](http://www.rubymotion.com/),
so you'll need to purchase and install it in order to build and run the app
yourself.

_Don't want to install RubyMotion? Consider running the web app in 
[standalone mode](#standalone-mode)._

## Run the status bar app
Once you have RubyMotion installed, run the following:
```bash
cd DossierProto
rake
```

This should build and run the status bar app. __This may take a LONG time
the first time you do it.__ After it's done, you should see the app pop up in
your status bar.

## Standalone Mode
To run the app in standalone mode you'll need to change the `standalone`
variable in in _globals.scss. However, in order for this to take effect you'll
need to recompile the SCSS with Compass. Compass in turn depends on Ruby, which
you should already have installed if you're running OSX.

In order to install Compass, you'll need to run the following:
```bash
gem install compass
```

See the [compass installation documentation](http://compass-style.org/install/)
for more information.

After you've installed compass (or if you already had it installed), run the
following commands in order to recompile the SCSS.
```bash
cd server/static
compass watch
```

This will immediately recompile the existing SCSS as well as watch for any
future changes.
