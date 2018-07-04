---
layout: post
title: "How To Update Ember.js"
date: 2018-07-04T09:28:13+12:00
author: Zoltan
categories: emberjs
identifier: 'update-emberjs'
---

You can keep your Ember application up-to-date with a few simple steps.

### Use ember-cli-update

Update dependencies:

    $ cd your-project-directory
    $ npx ember-cli-update
    $ npm install

Test your application, if you are happy commit these changes.

Let's run the "codemods", so it will update our sourcecode to the latest standard.    
    
    $ npx ember-cli-update --run-codemods

Run your tests, check your project again. I'm sure, it will be perfect.

Done. ;)

More details: [Ember CLI Update addon](https://github.com/ember-cli/ember-cli-update)

### A few maintenance tip

You can use `ncu`, "npm check updates" to see which other package in your project is deprecated.

    $ npx ncu
  
Sometimes it is quite useful to clean up your project's temporary folders (`tmp`, `dist`), `node_modules`, reinitialise the lock file and reinstall all the packages and rebuild the project.

    $ rm -rf node_modules package-lock.json tmp dist
    $ npm i
    $ ember build  

> Don't forget to check out the new chapter of the free [Ember.js](http://yoember.com) tutorial
