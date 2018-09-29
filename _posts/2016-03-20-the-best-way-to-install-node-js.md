---
layout: post
title: "The Best Way to Install Node.js"
date: 2018-09-29T00:50:00+13:00
author: Zoltan
categories: nodejs
identifier: 'install-nodejs'
node_version: '10.11.0'
npm_version: '6.4.1'
nvm_version: '0.33.11'
---

There are a few ways to install Node.js, but it looks like only one way gives you the best experience for long term.

### On Mac

The best way to install Node.js on Mac is `nvm`.

<https://github.com/creationix/nvm>

You have to have on your Mac the Command Line Tools. Or you install the full XCode from App Store either just use the small Command Line Tools installer:

```
$ xcode-select --install
```

(If you've just installed XCode, don't forget to launch it first and accepting the Terms and Conditions.)

You can use the install script for `nvm` installation.

```
$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v{{ page.nvm_version }}/install.sh | bash
```

However, I would encourage you to use the manual installation process. Nothing special there. Firstly, you just clone the whole repo in a subfolder in your home directory. (`~/.nvm`) Secondly, you add two extra lines to your console script.

Please follow these steps on NVM Readme: <https://github.com/creationix/nvm#git-install>

You have to relaunch your Terminals. Maybe you have to log out and log back to activate the new settings.

List your installed node versions:

```
$ nvm list
```

List the available node versions in the cloud:

```
$ nvm ls-remote
```

You can use the combination of this two commands to see only the last 9 lines from the huge list of versions: `$ nvm ls-remote | tail -n9`    

It is safe if you choose one of the most recent LTS (long time support) version and install it with the following command:

```
$ nvm install {{ page.node_version }}
```

Setup this version as the default.

```
$ nvm use {{ page.node_version }}
$ nvm alias default {{ page.node_version }}
```
Check your node version with

```
$ node -v
```
You should see `v{{ page.node_version }}` if you installed the above version.

You can update your `npm` to the latest.

```
$ npm install -g npm
```

After the update, the npm version, `npm -v`, should be at least `{{ page.npm_version }}` or above.

A little extra tip. Remember for the following command because it simplifies the update process. ;)

Let's say, you would like to stay on the stable, LTS version and you would like to keep all the global package what you've already installed. Here is the solution:

```
$ nvm install 8 --reinstall-packages-from=8 --latest-npm
```

It updates your Node.js version to the latest version 8 and install the latest npm, plus it setup all your previously installed global packages.

Alternatives for installing Node.js, but not suggested:

* Official Installer: <https://nodejs.org/en/download/>
* Using brew: <https://nodejs.org/en/download/package-manager/#osx>

### On Linux

Please avoid to install Node.js with `apt-get` on Ubuntu.
If you already installed Node.js with the built in package manager, please remove that. (`sudo apt-get purge nodejs && sudo apt-get autoremove && sudo apt-get autoclean`)

The installation process on Linux is the same as on OSX.

With the provided script:

```
$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v{{ page.nvm_version }}/install.sh | bash
```

(Please read the instructions under OSX section.)

```
$ nvm list
$ nvm ls-remote
$ nvm install {{ page.node_version }}
$ nvm use {{ page.node_version }}
$ nvm alias default {{ page.node_version }}
$ node -v
$ npm install -g npm
$ npm -v
```

One more thing! Don't forget to run the following command, which increases the amount of inotify watches.

```
$ echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
```

### On Windows

On Windows, if you don't need more version from Node.js, you can use the [official installer](https://nodejs.org/en/download/current/).

Install also [Git for Windows](https://git-for-windows.github.io/).

Additionally, don't forget to read [this instruction](http://ember-cli.com/user-guide/#windows), which is very interesting not just for Ember developers, but for everybody who uses Node.js on Windows.

Plus install and run `ember-cli-windows`

```
$ npm install -g ember-cli-windows
$ ember-cli-windows
```

More here: https://github.com/felixrieseberg/ember-cli-windows

Always run your PowerShell or CMD.exe as Administrator.

Don't forget to run these two commands in PowerShell (as Administrator):

```
$ Set-ExecutionPolicy Unrestricted -scope Process
$ ember-cli-windows
```
Log out and log back in Windows.

Try to upgrade `npm` and after install the latest `ember-cli`

```
$ npm install -g npm
$ npm install -g ember-cli
```
I would suggest, experiment with different shells. Which worked better for you? PowerShell, Git Shell, the original CMD.exe? Please, share your Windows experiment in a comment.

> Now, you have Node.js on your machine, it's time to go back to the [Ember Tutorial](https://yoember.com)

<div id="disqus_thread"></div>
