---
layout: post
title: "The Best Way to Install Node.js"
date: 2016-02-05T02:19:03+13:00
author: Zoltan
categories: nodejs
---

There are a few ways to install Node.js, but it looks only one way gives you the best experience for long term.

### On Mac

The best way to install Node.js on Mac is `nvm`.

https://github.com/creationix/nvm

You have to have on your Mac the Command Line Tools. Or you install the full XCode from App Store either just use the small Command Line Tools installer:

 ```
 xcode-select --install
 ```

(If you've just installed XCode, don't forget to launch it first and accepting the Terms and Conditions.)

You can use the install script for `nvm` installation.

```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash
```

However, I would encourage you to use the manual installation process. Nothing special there. Firstly, you just clone the whole repo in a subfolder in your home directory. (`~/.nvm`) Secondly, you add two extra lines to your console script.

Please follow these steps on NVM Readme: https://github.com/creationix/nvm#manual-install

You have to relaunch your Terminals. Maybe you have to log out and log back to activate the new settings.

List your installed node versions:

```
$ nvm list
```

Install the available node versions on the cloud:

```
$ nvm ls-remote
```

Choose the most recent version. (At the moment it is v5.5.0)
Install the selected version with the following command:

```
$ nvm install 5.5.0
```

Setup this version as the default.

```
$ nvm use 5.5.0
$ nvm alias default 5.5.0
```
Check your node version with

```
$ node -v
```
You should see `v5.5.0` if you installed the above version.

You can update your `npm` to the latest.

```
$ npm install -g npm
```

After the update, the npm version, `npm -v`, should be at least `3.6.0` or above.

Alternatives, but not suggested:
* Official Installer: https://nodejs.org/en/download/
* Using brew: https://nodejs.org/en/download/package-manager/#osx

### On Linux

Please avoid to install Node.js with `apt-get` on Ubuntu.
If you already installed Node.js with the built in package manager, please remove that. (`sudo apt-get purge nodejs && sudo apt-get autoremove && sudo apt-get autoclean`)

The installation process on Linux is the same as on OSX.

With the provided script:

```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash
```

(Please read the instructions under OSX section.)

```
$ nvm list
$ nvm ls-remote
$ nvm install 5.5.0
$ nvm use 5.5.0
$ nvm alias default 5.5.0
$ node -v
$ npm install -g npm
$ npm -v
```

### On Windows

On Windows, if you don't need more version from Node.js, you can use the [official installer](https://nodejs.org/en/download/stable/).

Install also [Git for Windows](https://git-for-windows.github.io/).

Don't forget to read [this instruction](http://ember-cli.com/user-guide/#windows).

Install and run `ember-cli-windows`

```
$ npm install -g ember-cli-windows
$ ember-cli-windows
```

<div id="disqus_thread"></div>
<script>
  var disqus_config = function () {
    this.page.url = 'http://yoember.com/nodejs/the-best-way-to-install-node-js/';
    this.page.identifier = 'install-node-js';
  };

  (function() {
    var d = document, s = d.createElement('script');

    s.src = '//yoember.disqus.com/embed.js';

    s.setAttribute('data-timestamp', +new Date());
    (d.head || d.body).appendChild(s);
  })();
</script>
