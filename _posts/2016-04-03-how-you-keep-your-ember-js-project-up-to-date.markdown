---
layout: post
title: "How You Keep Your Ember.js Project Up-To-Date"
date: 2016-04-03T09:28:13+12:00
author: Zoltan
categories: emberjs
identifier: 'update-emberjs'
---

You can keep your Ember application up-to-date with a few simple steps.

One of the most important that always follow and read the blog posts about the new version on Ember.js website.

My strategy is quite simple. I would like to know which packages are changed. Outside of the active project, I update ember-cli, and I create a new dummy app, so I can compare the version numbers and every type of changes between the new dummy app and my older active project.

### Upgrade ember-cli

Outside your older ember app folder:

    $ cd ~
    $ npm install -g ember-cli

Check your ember-cli version (outside of your project folder).

    $ cd ~
    $ ember -v

You should see the latest version.

### Create a new dummy ember application

So we can compare packages in `bower.json` and `package.json`.

    $ cd ~/projects/temp
    $ ember new my-v24-app

### Upgrade version numbers in your old project to match with the new dummy app.

Check your `bower.json` and `package.json` align the version numbers in your old project to match with the new defaults. (Update ember-cli, ember, ember-data, etc.) It is time to double check your other packages, like sass or firebase, etc. packages also, maybe there are an updated version which is compatible with the new Ember.

### Remove `bower_components` and `node_modules`

For avoiding package conflicts the most safest solution if you just remove these folders and reinstall all your packages.

    $ cd my-updated-project
    $ rm -rf bower_components node_modules
    $ npm install && bower install

Good luck! :)

> Don't forget to check out the new chapter of the [free Ember.js tutorial](http://yoember.com)
