---
layout: home
last_modified_at: 31/01/2016
---
# Ember.js 2 Tutorial 
## Building a complex web application with Ember.js 2.3
<p class="blog-post-meta">Latest update: <time datetime="2016-01-31" itemprop="datePublished">31 Jan 2016</time> • <span itemprop="author" itemscope itemtype="http://schema.org/Person"><span itemprop="name"><a href='http://zoltan.nz'>Zoltan</a></span></span></p>


This is an [Ember.js 2 tutorial](http://yoember.com) from absolute beginners to advance.

Welcome! Please check the [Live Demo](https://library-app.firebaseapp.com) page and check out what you are going to build.

* Live demo: [library-app.firebaseapp.com](https://library-app.firebaseapp.com/)

You can clone the original repository from GitHub and you can launch on your desktop.

* Original repo: [https://github.com/szines/library-app](https://github.com/szines/library-app)

If you have any comment, suggestion or you have a question, please feel free to contact with me.

* My Twitter: [@szines](https://www.twitter.com/szines)
* My Website: [zoltan.nz](http://zoltan.nz)

Don't hesitate to send me a message on Ember.js community Slack Channel.

* Ember.js Community Slack: [@zoltan](https://embercommunity.slack.com/messages/general/team/zoltan/)

## Other tutorials

* Bookstore API (Ruby on Rails): [https://github.com/szines/bookstore-api](https://github.com/szines/bookstore-api)
* Bookstore Client (Ember.js): [https://github.com/szines/bookstore-client](https://github.com/szines/bookstore-client)
* Contacts App Client (Ember.js): [https://github.com/szines/contacts-app-client](https://github.com/szines/contacts-app-client)
* Chat App (Ember.js): [https://github.com/szines/chat-app-v2](https://github.com/szines/chat-app-v2) 

## Contents

* [Lesson 1 - Creating our first static page with Ember.js](#lesson-1)
* [Lesson 2 - Computed property, actions, dynamic content](#lesson-2)
* [Lesson 3 - Models, saving data in database](#lesson-3)
* [Lesson 4 - Deploy your app and add more CRUD functionality](#lesson-4)
* [Lesson 5 - Data down actions up, using components](#lesson-5)
* [Lesson 6 - Advance model structures and data relationships](#lesson-6)

## Prerequisites

* node.js: at least 0.12, but the best if you install the latest 5.5.0.

Suggested way to install node.js: [https://github.com/creationix/nvm](https://github.com/creationix/nvm)

* Ember Inspector Chrome Extension

Install Ember Inspector Chrome extension in your Chrome Browser: [Ember Inspector](https://chrome.google.com/webstore/detail/ember-inspector/bmdblncegkenkacieihfhpjfppoconhi?hl=en)

* (Optional) Watchman from Facebook

Install Watchman on Mac: `brew install watchman`
More info: https://facebook.github.io/watchman/

## <a name='lesson-1'></a>Lesson 1

This tutorial uses the latest Ember-CLI tool (v2.3.0-beta.1 at end of Jan 2016).

### Install ember-cli

The following `npm` command installs Ember-CLI specified version in the global namespace. At the moment Ember-CLI version 2.3 is still in Beta phase, but it is perfect to create new Ember applications. (The Ember.js and Ember Data packages are stable and production ready.)

    $ npm install -g ember-cli@2.3.0-beta.1

You have now a new `ember` command in your console. Check with

    $ ember -v
    
You should see something similar:

``` bash {% raw %}
version: 2.3.0-beta.1
node: 5.5.0
npm: 2.14.10
os: darwin x64{% endraw %}
```

(Node version, npm version and os version may be different in your configuration.)

Please read more about Ember-CLI here: [www.ember-cli.com](http://www.ember-cli.com)

### Create the app

In your terminal, navigate in the folder where you usually create your web applications.
For example, if you have a `project` folder use `cd ~/project`.

Insider this folder run the following command.

    $ ember new library-app

This command will create the new app for you.
Please enter in your new app with `cd library-app`.

Open this folder in your favourite code editor and look around. You will see a couple of files and folders. Ember-CLI is scaffolded for you everything what need to run and create an amazing web application. 

### Launch the app

Your skeleton app is ready and you can run it with the following command. Type in your terminal:

    $ ember server

Open your new empty app in your browser: <a href="http://localhost:4200" target="_blank">http://localhost:4200</a>

You should see a "Welcome to Ember" message on your website. Well Done! You have your first Ember.js application. :)
You can open Ember Inspector in your Browser. Hope you've already installed it. Ember Inspector exists in Chrome and in Firefox as an extension. After installation you should have a new tab in your developer console in your browser. Check it out, look around. [More details about Ember Inspector here](https://guides.emberjs.com/v2.3.0/ember-inspector/installation/). 

### Turn on a couple of debugging option

If you would like to see more in your browser's console, what Ember.js is doing under the hood, you can turn on a couple of debugging option in your configuration file.

You can find a list of debugging options in `./config/environment.js` file. Remove the comment sign as follow:

``` javascript {% raw %}
    //..
    if (environment === 'development') {
      // ENV.APP.LOG_RESOLVER = true;
      ENV.APP.LOG_ACTIVE_GENERATION = true;
      ENV.APP.LOG_TRANSITIONS = true;
      ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
      ENV.APP.LOG_VIEW_LOOKUPS = true;
    }
    //..{% endraw %}
```
Check your app and open the Console in Chrome. You will see a couple of extra information what Ember.js automatically doing.

### Add Sass and Bootstrap to your app

Exit your `ember server` with `Ctrl+C` in your terminal.

Run the following two command in your terminal.

    $ ember install ember-cli-sass
    $ ember install ember-cli-bootstrap-sassy

You will see, that your `./package.json` and `./bower.json` are extended with a couple of lines.

Rename your `app.css` to `app.scss` with the following terminal command or you can use your editor to rename the `./app/styles/app.css` file:

    $ mv app/styles/app.css app/styles/app.scss

Open `./app/styles/app.scss` file in your editor and add the following line:

    @import "bootstrap";

Relaunch your app with `ember server`. You should see in the browser, that 'Welcome to Ember' uses Bootstrap default font.

Above steps in a one liner. Copy-paste to your console (without $). This is usefull if you create a new project and you would like to add Bootstrap in a second.

``` {% raw %}
$ ember install ember-cli-sass && ember install ember-cli-bootstrap-sassy && echo '@import "bootstrap";' > ./app/styles/app.scss && rm ./app/styles/app.css
{% endraw %}```

### Create a navigation partial

We will use bootstrap navigation bar to create a nice header section for our app.

Update your main template file. Delete the example content and add the following code to your `./app/templates/application.hbs`.

``` html {% raw %}
<div class="container">
  {{partial 'navbar'}}
  {{outlet}}
</div>{% endraw %}
``` 

Generate a `navbar.hbs` file with the following command in you terminal.

    $ ember generate template navbar

You can open `./app/templates/navbar.hbs` in your editor and add the following lines:

```html {% raw %}
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      {{#link-to 'index' class="navbar-brand"}}Library App{{/link-to}}
    </div>

    <div class="collapse navbar-collapse" id="main-navbar">
      <ul class="nav navbar-nav">
            {{#link-to 'index' tagName="li"}}<a href="">Home</a>{{/link-to}}
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>{% endraw %}
```

Launch your application with `ember server`. You should see your new navigation bar in your browser.

You can update your `app.scss` file to add some extra padding to the top. The updated `./app/styles/app.scss` content:

```css
@import "bootstrap";

body {
  padding-top: 20px;
}
```

### Create a new About page and add the link to the menu bar

Run the following command in your terminal

    $ ember generate route about

A new route and template created in your project.

Open your new `./app/templates/about.hbs` file in your editor, delete its content and add the following line:

```html
<h1>About Page</h1>
```    

You can launch your app with `ember server` and navigate to http://localhost:4200/about page, you should see the created `About Page` header message. If you click on `Home` in your menu bar, your page will be empty. Let's fix that.

Create a new `index` template with the following command in your terminal:

    $ ember generate template index

Open in your editor the generated `./app/templates/index.hbs` file and add the following:

```html
<h1>Home Page</h1>
```

If you launch your app, you should see the above message on your home page, however we still doesn't have About link in our menu bar.

Open your `./app/templates/navbar.hbs` and add the following line to the `ul` section under `Home` link:

``` handlebars {% raw %}
    {{#link-to 'about' tagName="li"}}<a href="">About</a>{{/link-to}}{% endraw %}
```

Your `ul` section in `navbar.hbs` should look like this:

``` handlebars {% raw %}
<ul class="nav navbar-nav">
      {{#link-to 'index' tagName="li"}}<a href="">Home</a>{{/link-to}}
      {{#link-to 'about' tagName="li"}}<a href="">About</a>{{/link-to}}
</ul>{% endraw %}
```

If you check your app in the browser, you should see `Home` and `About` link in your menu bar, you can click on them and you will see how the page content and the url are changed. The `active` state of the link changes the style of the menu link automatically as well. However Bootstrap expect the `active` class in `li` and expects an anchor tag inside the `li` tag. For this reason we have to use  

### Homework

Create a `Contact` page. Extend the navigation bar with "Contact" menu.

## <a name='lesson-2'></a>Lesson 2

### Coming Soon homepage with an email input box

Let's create a coming soon jumbotron on the home page with an email input box, where users can subscribe for a newsletter.

* Bootstrap's jumbotron: http://getbootstrap.com/components/#jumbotron
* Bootstrap's forms: http://getbootstrap.com/css/#forms

#### Only static html5 and style

Add a static jumbotron, an input box and a button to `index.hbs`.

```html
    <div class="jumbotron text-center">
        <h1>Coming Soon</h1>

        <br/><br/>

        <p>Don't miss our launch date, request an invitation now.</p>

        <div class="form-horizontal form-group form-group-lg row">
            <div class="col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-1 col-md-5 col-md-offset-2">
              <input type="email" class="form-control" placeholder="Please type your e-mail address." autofocus="autofocus"/>
            </div>
            <div class="col-xs-10 col-xs-offset-1 col-sm-offset-0 col-sm-4 col-md-3">
                <button class="btn btn-primary btn-lg btn-block">Request invitation</button>
            </div>

        </div>

        <br/><br/>
    </div>
```

#### Requirements

We would like to cover the following requirements:

* "Invite me" button should be inactive when input box is empty
* "Invite me" button should be inactive when the content in the input box is not valid email address.
* Show a response message after clicking of "Invite me" button.
* Clear the input box when invitation sent.

#### isDisabled

We can add dynamic values to standard html properties using conditionals. We can use our controller to add or modify the value of a variable, what we use in our template. Check the following solution. We create a boolean variable, let's call it `isDisabled` will provide the state of `disabled` html attribute.

From the official guide:
"Each template has an associated controller: this is where the template finds the properties that it displays. You can display a property from your controller by wrapping the property name in curly braces."

Add `disabled` property with {% raw %}`{{if}}`{% endraw %} helper. (Note: adding `disabled` style to the class will not disable the button properly when we will implement an `action` later.)

``` handlebars {% raw %}
<button class="btn btn-primary btn-lg btn-block" disabled="{{if isDisabled 'disabled'}}">Request invitation</button>{% endraw %}
``` 

* More about conditionals in templates: http://guides.emberjs.com/v2.3.0/templates/conditionals/

Create index controller

    $ ember g controller index

* Read more about Ember controllers here: http://guides.emberjs.com/v2.3.0/controllers/

Note: Ember.js still uses controllers, however controller layer will be deprecated and will be removed from Ember.js 3.0. We use controller to practice some interesting feature, but later we will refactor our app and we will move most of the logic inside components.

Add `isDisabled` property to the controller. Default value is `true`.

``` javascript {% raw %}
    //app/controllers/index.js
    import Ember from 'ember';

    export default Ember.Controller.extend({

      isDisabled: true

    }); {% endraw %}
```

You can check your app, the button will be disabled by default.

#### Computed Properties and Observers

Computed Properties and Observers are important features of Ember.js. Please read more about it in the official guide first.

* Computed Properties: http://guides.emberjs.com/v2.3.0/object-model/computed-properties/
* Observers: http://guides.emberjs.com/v2.3.0/object-model/observers/

Please note, we will use the traditional syntax in the following code, it means `.property()` and `.observes()` will be attached to the functions.

Computed properties and observers could be written in two ways. It is important to know the "old" syntax and the "new" syntax, so when you see older project, you will recognise this pattern.

Old (with ES5):

``` javascript
//...
fullName: function() {
  return this.get('firstName') + ' ' + this.get('lastName');
}.property('firstName', 'lastName')
//...
```

New (with ES6):

``` javascript
//...
fullName: Ember.computed('firstName', 'lastName', function() {
  return `${this.get('firstName')} ${this.get('lastName')}`;
}
//...
```

First, update your html code with input component syntax and add a `value` to our email input box.

Modify `<input>` line as follow in `index.hbs`:

``` handlebars {% raw %}
{{input type="email" value=emailAddress class="form-control" placeholder="Please type your e-mail address." autofocus="autofocus"}}{% endraw %}
```

As you can see, we use `emailAddress` variable, or better word, a "property" where we would like to store the value of the input box.

If you type something in the input box, it will update this variable in the controller as well.

You can use the following code in your controller to demonstrate the differences between computed properties and observers:

``` javascript
    emailAddress: '',

    actualEmailAddress: function() { 
      console.log('actualEmailAddress function is called: ', this.get('emailAddress'));
    }.property('emailAddress'),

    emailAddressChanged: function() { 
      console.log('observer is called', this.get('emailAddress')); 
    }.observes('emailAddress')
```

Observers will be called always when the value of the `emailAddress` changes, the computed property only when you use it. Use Ember Inspector, click on `/# Routes` section, find the `index` route, in the same line, under `Controller` column, you will see an `>$E` sign, click on it. Open the console in Chrome and you will see something like this: `Ember Inspector ($E):  Class {__nextSuper: undefined, __ember_meta__: Object, __ember1442491471913: "ember443"}`

If you type the following in the console: `$E.get('actualEmailAddress')`, you should see the above created `console.log` message, that "actualEmailAddress is called".

Please play with the above example and try to create your own observers and computed properties.

We can rewrite our `isDisabled` with computed property as well.

``` javascript
// app/controllers/index.js
import Ember from 'ember';

export default Ember.Controller.extend({

  emailAddress: '',

  isDisabled: function() {
    return this.get('emailAddress') === '';
  }.property('emailAddress')

});
```

But the above solution works only if the input box is not empty. It is not checking how valid the email address.

You can use the new Ember.js 2 syntax as well.

``` javascript
// app/controllers/index.js
import Ember from 'ember';

export default Ember.Controller.extend({

  emailAddress: '',

  isDisabled: Ember.computed('emailAddress', function() {
    return this.get('emailAddress') === '';
  }

});
```

Or you can use the short version:

``` javascript
// app/controllers/index.js
import Ember from 'ember';

export default Ember.Controller.extend({

  emailAddress: '',

  isDisabled: Ember.computed.empty('emailAddress')

});
```
* More about `Ember.computed` short versions: http://emberjs.com/api/classes/Ember.computed.html

#### isValid

More elegant solution if we enable our "Invite me" button only when input box contains a valid email address.

``` javascript
// app/controllers/index.js
import Ember from 'ember';

export default Ember.Controller.extend({

  emailAddress: '',

  isValid: Ember.computed.match('emailAddress', /^.+@.+\..+$/),

});
```

We deleted the `isDisabled` property instead we will use `isValid`. Update your `index.hbs` `<button>` tag as below.

``` handlebars {% raw %}
<button class="btn btn-primary btn-lg btn-block" disabled="{{unless isValid 'disabled'}}">Request invitation</button>{% endraw %}
```

#### Add our first Action

Update your `<button>` line again.

``` handlebars {% raw %}
<button class="btn btn-primary btn-lg btn-block" disabled="{{unless isValid 'disabled'}}" {{action 'saveInvitation'}}>Request invitation</button>{% endraw %}
```

You can try out in your browser, that if you click on the button, you will get a nice error message, which alerts you, that you have to implement this action in your controller. Let's do that.

``` javascript
// app/controllers/index.js
import Ember from 'ember';

export default Ember.Controller.extend({

  emailAddress: '',

  isValid: Ember.computed.match('emailAddress', /^.+@.+\..+$/),

  actions: {
    saveInvitation: function() {
      alert('Saving of the following email address is in progress: ' + this.get('emailAddress'));
      this.set('responseMessage', "Thank you! We've just saved your email address: " + this.get('emailAddress'));
      this.set('emailAddress', '');
    }
  }

});
```
If you click on the button, `saveInvitation` action will be called and show an alert box, after it will setup a responseMessage, finally delete the content of `emailAddress`.

``` handlebars {% raw %}
<!-- app/templates/index.hbs -->
<div class="jumbotron text-center">
    <h1>Coming Soon</h1>

    <br/><br/>

    <p>Don't miss our launch date, request an invitation now.</p>

    <div class="form-horizontal form-group form-group-lg row">
        <div class="col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-1 col-md-5 col-md-offset-2">
            {{input type="email" value=emailAddress class="form-control" placeholder="Please type your e-mail address." autofocus="autofocus"}}
        </div>
        <div class="col-xs-10 col-xs-offset-1 col-sm-offset-0 col-sm-4 col-md-3">
            <button class="btn btn-primary btn-lg btn-block" {{action 'sendInvitation'}} disabled="{{unless isValid 'disabled'}}">Request invitation</button>
        </div>

    </div>

    {{#if responseMessage}}
      <div class="alert alert-success">{{responseMessage}}</div>
    {{/if}}


    <br/><br/>

</div>{% endraw %}
```

### Homework

You already have an amazing `Contact` page, where we would like to add a contact form. In this contact form would be two fields. One field for email address and one field for text message. And there would be a “Send message” button. This button should be active only if email address field not empty and valid and there is some message in the text box. After clicking on “Send message” button should appear an Alert with the email address and the message. When you close the alert message, the form should be cleared and a message should appear in the page in green box, this message could be something about "we got your message and get in touch soon".

Hint: you already have a `contact.hbs` but you need a controller where you manage these logics.

Bonus point if you can add validation to `textarea`. One option, the textarea shouldn't be empty, other option, the length of the message at least 5 character long.

``` handlebars
{% raw %}{{textarea class="form-control" placeholder="Your message. (At least 5 characters.)" rows="7" value=message}}{% endraw %}
```

Short version of computed property for `greater than or equal`:

    Ember.computed.gte('yourProperty', number)

(Please note, it is `computed.gte` and not `computed.get`.)

If you have two computed property, and both has to be `true` you can use a third computed property with `and`.

    Ember.computed.and('firstComputedProperty', 'secondComputedProperty')

You can get a string computed property length with `.length`. If your computed property is `message`, the length of that message is `message.length`.

* In terms of feedback on a form, there is a really cool solution on bootstrap: http://getbootstrap.com/css/#forms-control-validation (Check the "With optional icons" section.)

## <a name='lesson-3'></a>Lesson 3

### Our first Ember.js Model

We ask email addresses on the home page, but we don't save them at the moment in the database. It is time to implement this feature in our website.

* Please read the detailed introduction on Ember.js website about Ember.js Models: http://guides.emberjs.com/v2.3.0/models/

Let's create our first model where we save email addresses for invitation. Type the following command in your command line.

    $ ember g model invitation email:string

Hope you read about `store` in the official Guide. Let's use it.

Update your `app/controllers/index.js` controller action. Instead of showing a useless alert message, we try to save our data.

``` javascript {% raw %}
// app/controllers/index.js
import Ember from 'ember';

export default Ember.Controller.extend({

  headerMessage: 'Coming Soon',
  responseMessage: '',
  emailAddress: '',

  isValid: Ember.computed.match('emailAddress', /^.+@.+\..+$/),

  actions: {
    saveInvitation: function() {
      var email = this.get('emailAddress');

      var newInvitation = this.store.createRecord('invitation', {email: email});
      newInvitation.save();

      this.set('responseMessage', "Thank you! We've just saved your email address: " + this.get('emailAddress'));
      this.set('emailAddress', '');
    }
  }
});
```

Check your browser, open the browser's console. Try to save an invitation email address on home page. You will see an error message in the console.

Ember.js tried to send that data to a server, but we don't have a server yet. Let's build one.

### Setup a server on Firebase

Firebase is a server and API service. Very easy to use. http://www.firebase.com

1. Create an account.
2. Read the guide and help section, especially the instructions about EmberFire: https://www.firebase.com/docs/web/libraries/ember/guide.html
3. Follow the instructions. First, run the following command in your terminal: `ember install emberfire`
4. Go back to Firebase and create an app there. Remember the name of your app.
5. Update your config file in your Ember.js app. In `config/environment.js` should have a `firebase` property. Update the url with your Firebase app url what you have just created on Firebase website.

``` javascript
// config/environment.js

var ENV = {
        modulePrefix: 'library-app',
        environment: environment,
        contentSecurityPolicy: {
            'connect-src': "'self' https://auth.firebase.com wss://*.firebaseio.com"
        },
        firebase: 'https://WRITE_HERE_YOUR_APP_NAME.firebaseio.com/',
        baseURL: '/',
        locationType: 'auto',
```

Try out Request Invitation button again, check the browser's console messages and open the Firebase website, and check your app dashboard. You will see, that the email address, what you just saved on your home page, is sent to Firebase and it is saved on the server.

Well done!

### Promise and the `this` context in javascript

Promise is a unique asynchronous feature in javascript. Basically an object, which hasn't completed yet, but is expected in the future. You can read more about it on Mozilla website: https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Promise

In our code, we use a Promise: `.save()`

The `save` method on Ember Data Model is a `Promise`. It promises us that it is trying to save our data. It could be successful or maybe return with error.

We can catch the result of a `Promise` with a chained `.then()`. In our example:

    newInvitation.save().then(function(response) {
      console.log('Email address is saved.')
    })

If the saving process is successful, 'fulfilled', then we will get back a response from the server, what we can catch in our function parameter.

We have to move our lines, which showing our success message inside this new function, because we would like to show that message only, when the data is really saved.

If you would simply just copy paste, you will realize the code will not work as expected.

    newInvitation.save().then(function(response) {
      this.set('responseMessage', "Thank you! We've just saved your email address: " + this.get('emailAddress'));
      this.set('emailAddress', '');
    })

In javascript the `this` points always to the object which is wrapping around. In the above example, the `this` will be undefined, because we are in a function after the Promise. Please learn more about it here: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/this

We have to save the controller context in a local variable, what we can use inside our `then`.

Please update your controller.

``` javascript
// app/controllers/index.js

import Ember from 'ember';

export default Ember.Controller.extend({

    headerMessage: 'Coming Soon',
    responseMessage: '',
    emailAddress: '',

    isValid: Ember.computed.match('emailAddress', /^.+@.+\..+$/),

    actions: {
        saveInvitation: function() {
            var _that = this;
            var email = this.get('emailAddress');

            var newInvitation = this.store.createRecord('invitation', {
                email: email
            });
            newInvitation.save().then(function(response) {
                _that.set('responseMessage', "Thank you! We saved your email address with the following id: " + response.get('id'));
                _that.set('emailAddress', '');
            });
        }
    }
});
```

We save the `this` controller context in a `_that` local variable. We use this local variable inside our function after Promise. The above example uses `response` and shows the `id` of the generated database record.

Great, our home page is ready.

(Please note, there is a new syntax in ES6/ES2015 javascript, where we can use `=>` to pass the context automatically inside an asynchronous function. I will explain this later. If you are new in JavaScript, the best if you know the old and the new syntax as well.)

### Create an Admin page

We would like to list out from the database the persisted email addresses.

Let's create a new route and page what we can reach with the following url: `http://localhost:4200/admin/invitations`

    $ ember g route admin/invitations

Add this new page to the `navbar.hbs` with a dropdown.

``` handlebars
<!-- app/templates/navbar.hbs -->
{% raw %}<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      {{#link-to 'index' class="navbar-brand"}}Library App{{/link-to}}
    </div>

    <div class="collapse navbar-collapse" id="main-navbar">
      <ul class="nav navbar-nav">
            {{#link-to 'index' tagName="li"}}<a href>Home</a>{{/link-to}}
            {{#link-to 'about' tagName="li"}}<a href>About</a>{{/link-to}}
            {{#link-to 'contact' tagName="li"}}<a href>Contact</a>{{/link-to}}
      </ul>

      <ul class="nav navbar-nav navbar-right">
          <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Admin<span class="caret"></span></a>
              <ul class="dropdown-menu">
                  {{#link-to 'admin.invitations' tagName="li"}}<a href>Invitations</a>{{/link-to}}
              </ul>
          </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>{% endraw %}
```

Add a table to `app/templates/admin/invitations.hbs`

``` handlebars
<!-- app/templates/admin/invitations.hbs -->

{% raw %}<h1>Invitations</h1>

<table class="table table-bordered table-striped">
    <thead>
      <tr>
          <th>ID</th>
          <th>E-mail</th>
      </tr>
    </thead>
    <tbody>
    {{#each model as |invitation|}}
        <tr>
            <th>{{invitation.id}}</th>
            <td>{{invitation.email}}</td>
        </tr>
    {{/each}}

    </tbody>
</table>{% endraw %}
```

We use `{{#each}}{{/each}}` handlebar block to generate a list. The `model` variable will contain the array what we download from the server. Ember.js automatically populate responses from the server if we download it in the next step using our route file.

Let's download our data from the server using route and Ember Data.

* Please read more about Route's Model: http://guides.emberjs.com/v2.3.0/routing/specifying-a-routes-model/

Add the following code to your `app/routes/admin/invitations.js` file:

``` javascript
// app/routes/admin/invitations.js
import Ember from 'ember';

export default Ember.Route.extend({

  model: function() {
    return this.store.findAll('invitation');
  }

});
```

Launch your app and check your table in Admin. Do you like it? :)

### CRUD interface for libraries

We will create a new section in our app, where we can add new library or list the created libraries.

Firstly we create our `library` model.

    $ ember g model library name:string address:string phone:string

Secondly we create our new route. At the moment we do it without Ember-CLI, only manually adding the following lines to our `router.js`:

``` javascript
// app/router.js

import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('about');
  this.route('contact');

  this.route('admin', function() {
    this.route('invitations');
  });
  this.route('libraries', function() {
    this.route('new');
  });
});

export default Router;
```

Now we create 3 new templates. Our main `libraries.hbs`, a `libraries/index.hbs` for list and a `libraries/new.hbs` for new form.

    $ ember g template libraries
    $ ember g template libraries/index
    $ ember g template libraries/new

Update your `navbar.hbs` main navigation section as following.

``` handlebars
<!-- app/templates/navbar.hbs -->
{% raw %}
      <ul class="nav navbar-nav">
            {{#link-to 'index' tagName="li"}}<a href="">Home</a>{{/link-to}}
            {{#link-to 'libraries' tagName="li"}}<a href="">Libraries</a>{{/link-to}}
            {{#link-to 'about' tagName="li"}}<a href="">About</a>{{/link-to}}
            {{#link-to 'contact' tagName="li"}}<a href="">Contact</a>{{/link-to}}
      </ul>
{% endraw %}
```

Add a submenu to `libraries.hbs`

``` handlebars
<!-- app/templates/libraries.hbs -->
{% raw %}<h1>Libraries</h1>

<div class="well">
    <ul class="nav nav-pills">
      {{#link-to 'libraries.index' tagName="li"}}<a href>List all</a>{{/link-to}}
      {{#link-to 'libraries.new' tagName="li"}}<a href>Add new</a>{{/link-to}}
    </ul>
</div>

{{outlet}}{% endraw %}
```

Check your app, you should see a new menu point and there could be two submenu.

Other two templates have the following content.

``` handlebars
<!-- app/templates/libraries/index.hbs -->
{% raw %}<h2>List</h2>

{{#each model as |library|}}
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">{{library.name}}</h3>
        </div>
        <div class="panel-body">
            <p>Address: {{library.address}}</p>
            <p>Phone: {{library.phone}}</p>
        </div>
    </div>
{{/each}}{% endraw %}
```

We generate a list from our model which will be downloaded in the route. We are using `panel` style from bootstrap here.

``` handlebars
<!-- app/templates/libraries/new.hbs -->
{% raw %}<h2>Add a new local Library</h2>

<div class="form-horizontal">
    <div class="form-group">
        <label class="col-sm-2 control-label">Name</label>
        <div class="col-sm-10">
            {{input type="text" value=model.name class="form-control" placeholder="The name of the Library"}}
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Address</label>
        <div class="col-sm-10">
            {{input type="text" value=model.address class="form-control" placeholder="The address of the Library"}}
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Phone</label>
        <div class="col-sm-10">
            {{input type="text" value=model.phone class="form-control" placeholder="The phone number of the Library"}}
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default" {{action 'saveLibrary' model}}>Add to library list</button>
        </div>
    </div>
</div>{% endraw %}
```

We use `model` as our value store. You will see soon, that our model will be created in the route. The action will call `saveLibrary` function and we pass the `model` parameter to that function.

In your `app/routes` folder create `libraries` folder and add two js files: `index.js` and `new.js`

``` javascript
// app/routes/libraries/index.js
import Ember from 'ember';

export default Ember.Route.extend({

  model: function() {
    return this.store.findAll('library');
  }

})
```

We download here all the library from the server.


``` javascript
// app/routes/libraries/new.js
import Ember from 'ember';

export default Ember.Route.extend({

  model: function () {
    return this.store.createRecord('library');
  },

  actions: {
    saveLibrary: function (newLibrary) {
      var _that = this;

      newLibrary.save().then(function (response) {
        _that.transitionTo('libraries');
      })
    },

    willTransition: function (transition) {
      var model = this.controller.get('model');
      if (model.get('isNew')) {
        model.destroyRecord();
      }
    }
  }
});
```

In the above Route we create a new record and it will be the `model`. It automatically appears in the controller and in the template. In the `saveLibrary` action we accept a param and we save that model, after we send the application back to Libraries home page with `transitionTo`.

There is an Ember.js built in action (event) `willTransition`, which will be called when you leave a page (route). In our case, we use this action to reset the model if we haven't saved in the database before.

### Homework

Improve further your Contact Page.

1. Create a `contact` model with `email` and with `message` field.
2. Save that model in the server when someone click on "Send" button on Contact form. Update your `contact.js` controller.
3. Create an Admin page under `http://localhost:4200/admin/contacts`
4. List all saved messages in a table.

Option 2: Refactor your app contact section with usage of model in route. Move validation in model, move action in route and remove contact controller.

## <a name='lesson-4'></a>Lesson 4

### Deploy your app on Firebase

Follow the [guide on Firebase](https://www.firebase.com/docs/web/libraries/ember/guide.html#section-ember-deploy).

    $ npm install -g firebase-tools
    $ ember build --prod
    $ firebase init

Update `firebase.json`

    {
      "firebase": "your-app-name",
      "public": "dist",
      "rewrites": [{
        "source": "**",
        "destination": "/index.html"
      }]
    }

And deploy:

    $ firebase deploy

### Add Delete, Edit button and Edit route

#### Upgrading library list view to grid view

Let's upgrade our `app/templates/libraries/index.hbs` to show a nice grid layout. We have to add a little tweak to our stylesheet as well. You can see, there are two buttons in `panel-footer`. First button is a link to Edit screen, the second is a Delete button with an action. We send `library` as a param with that action call.

``` handlebars
<!-- app/templates/libraries/index.hbs -->
{% raw %}<h2>List</h2>
<div class="row">
  {{#each model as |library|}}
    <div class="col-md-4">
      <div class="panel panel-default library-item">
          <div class="panel-heading">
              <h3 class="panel-title">{{library.name}}</h3>
          </div>
          <div class="panel-body">
              <p>Address: {{library.address}}</p>
              <p>Phone: {{library.phone}}</p>
          </div>
          <div class="panel-footer text-right">
              {{#link-to 'libraries.edit' library.id class='btn btn-success btn-xs'}}Edit{{/link-to}}
              <button class="btn btn-danger btn-xs" {{action 'deleteLibrary' library}}>Delete</button>
          </div>
      </div>
    </div>
  {{/each}}
</div>{% endraw %}
```

``` scss
# app/styles/app.scss
@import 'bootstrap';

body {
  padding-top: 20px;
}

html {
  overflow-y: scroll;
}

.library-item {
  min-height: 150px;
}
```

If you would try to launch the app now, probably you will get an error message, because we haven't implemented `edit` route yet, and the delete `action` is missing also. Let's implement these.

#### Duplicate some code, create edit.js and edit.hbs

Add manually the new `edit` route to `router.js`. We setup a unique `path:` in the second parameter of `this.route()`. Because there is a `:` sign before the `library_id`, that part of the url will be copied in that variable as route param, and we can use it in our routes. For example, if the url is `http://example.com/libraries/1234/edit`, than `1234` will be passed as a param to route, so we can use in that route to download the model.

``` javascript
// app/router.js
import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('about');
  this.route('contact');

  this.route('admin', function() {
    this.route('invitations');
    this.route('contacts');
  });
  this.route('libraries', function() {
    this.route('new');
    this.route('edit', { path: '/:library_id/edit' });
  });
});

export default Router;
```

After we inserted this extra line in our router, time to create our `app/routes/libraries/edit.js`. You can use Ember-CLI or you can create manually. The code should looks like the following. More explanation below. (In this code, I use ES5 syntax, but later I will prefer ES6/ES2015. If you would like you can use ES6/ES2015 already.)

``` javascript
// app/routes/libraries/edit.js
import Ember from 'ember';

export default Ember.Route.extend({

  model: function (params) {
    return this.store.findRecord('library', params.library_id);
  },

  actions: {

    saveLibrary: function (newLibrary) {
      var _that = this;

      newLibrary.save().then(function (response) {
        _that.transitionTo('libraries');
      })
    },

    willTransition: function (transition) {

      var model = this.controller.get('model');

      if (model.get('hasDirtyAttributes')) {
        var confirmation = confirm("Your changes haven't saved yet. Would you like to leave this form?");

        if (confirmation) {
          model.rollbackAttributes();
        } else {
          transition.abort();
        }
      }
    }
  }
});
```

More things happening in this file.

First of all, in the `model` function, we have a `params` parameter. This params will get from the url that `id`. Simply, we can use it with `params.library_id`. The `this.store.findRecord('library', params.library_id);` line download only one record from the server with the given `id`. The `id` comes from the url.

We added two actions as well. The first will save the changes and after redirect to the main `libraries` page.

The second event-action will be called, when we are trying to leave this page, because we redirected from the previous action or the user clicked in a link on the website. In the first case, the changes already saved, but in the second case, it could happen, when the user modified something in the form but haven't saved. It is a typical "dirty checking". We can read the `model` from the controller, we use Ember Model's `hasDirtyAttributes` computed property to check something changed in the model. So we popup an ugly confirmation window. If the user would like to leave the page, we just rollback changes with `model.rollbackAttributes()`. If the user would like to stay in the page we abort the transition with `transition.abort()`. You can see, that we use `transition` variable which is initiated as a param in `willTransition` function. Ember.js automatically provides this for us.

Our template is still missing. Let's use our `new.hbs` and duplicate the code in `edit.hbs` with a little changes. We will fix this problem later with components, because code duplication is not nice.

``` handlebars
{% raw %}<h2>Edit Library</h2>

<div class="form-horizontal">
    <div class="form-group">
        <label class="col-sm-2 control-label">Name</label>
        <div class="col-sm-10">
          {{input type="text" value=model.name class="form-control" placeholder="The name of the Library"}}
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Address</label>
        <div class="col-sm-10">
          {{input type="text" value=model.address class="form-control" placeholder="The address of the Library"}}
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Phone</label>
        <div class="col-sm-10">
          {{input type="text" value=model.phone class="form-control" placeholder="The phone number of the Library"}}
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default" {{action 'saveLibrary' model}}>Save changes</button>
        </div>
    </div>
</div>{% endraw %}
```

If you launch your app, it should work, and you are able to edit the information from a library. You can check what is happening if you modify the data in the form, but finally click on a link somewhere (for example link on the menu) without saving the form data.

#### Add delete action

The delete action is still missing. Let's update `app/routes/libraries/index.js`

``` javascript
// app/routes/libraries/index.js
import Ember from 'ember';

export default Ember.Route.extend({

  model: function() {
    return this.store.findAll('library');
  },

  actions: {
    deleteLibrary: function(library) {
      var confirmation = confirm('Are you sure?');

      if (confirmation) {
        library.destroyRecord();
      }
    }
  }

})
```

### Homework

You can add delete buttons to your lists on Admin pages, so you can delete invitations and contact messages. It would be nice improvement as well if you could clean up `app/controllers/index.js` and add `createRecord` in `app/routes/index.js`. It would be similar to `libraries/new` section.

## <a name='lesson-5'></a>Lesson 5

### Cleaning up our templates with components

First of all, please read more about Components in Ember.js Guide: http://guides.emberjs.com/v2.1.0/components/defining-a-component/

We can generate a component with `ember g component` command. Let's create two components. First for library panel and one for forms.

```
$ ember g component library-item
$ ember g component library-item-form
```

Each command generates a javascript file and a handlebar file. Javascript part sits in `app/components` folder, the template in `app/templates/components`.

We can insert the following code in the `library-item` template.

``` handlebars
<!-- app/templates/components/library-item.hbs -->
{% raw %}<div class="panel panel-default library-item">
    <div class="panel-heading">
        <h3 class="panel-title">{{item.name}}</h3>
    </div>
    <div class="panel-body">
        <p>Address: {{item.address}}</p>
        <p>Phone: {{item.phone}}</p>
    </div>
    <div class="panel-footer text-right">
      {{yield}}
    </div>
</div>{% endraw %}
```

You can see, that this code is quite similar what we have in `app/templates/libraries/index.hbs`, however instead of `model` we use `item`.

The most important concept in terms of components, that they are totally independent from the context. They don't know "other things", other variables, only what they originally have and what passed inside with attributes.

We have a `{% raw %}{{yield}}{% endraw %}` which means, that we can use this component as a block component. The code which wrapped with this component will be injected inside the `{% raw %}{{yield}}{% endraw %}`.

For example:

``` handlebars
     {% raw %}{{#library-item item=model}}
        Closed
     {{/library-item}}{% endraw %}
```

In this case the `Closed` text will appear in the panel footer.

Let's add html to our `library-item-form` component as well.

``` handlebars
<!-- app/templates/components/library-item-form.hbs -->
{% raw %}<div class="form-horizontal">
    <div class="form-group has-feedback {{if item.isValid 'has-success'}}">
        <label class="col-sm-2 control-label">Name*</label>
        <div class="col-sm-10">
          {{input type="text" value=item.name class="form-control" placeholder="The name of the Library"}}
          {{#if item.isValid}}<span class="glyphicon glyphicon-ok form-control-feedback"></span>{{/if}}
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Address</label>
        <div class="col-sm-10">
          {{input type="text" value=item.address class="form-control" placeholder="The address of the Library"}}
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Phone</label>
        <div class="col-sm-10">
          {{input type="text" value=item.phone class="form-control" placeholder="The phone number of the Library"}}
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default" {{action 'buttonClicked' item}} disabled="{{unless item.isValid 'disabled'}}">{{buttonLabel}}</button>
        </div>
    </div>
</div>{% endraw %}
```

This code is almost the same what we used more times in our form in `libraries/new.hbs` and in `libraries/edit.hbs` templates.

Some tiny improvement. We can add a little validation to our `library` model. Please update `app/models/library.js` with a basic validation, where we check that the `name` is not empty.

``` javascript
import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  address: DS.attr('string'),
  phone: DS.attr('string'),

  isValid: Ember.computed.notEmpty('name')
});
```

Time to clean up our templates.

Using the `library-item` component in `app/templates/libraries/index.hbs` reduces the code and makes our template more cleaner.

``` handlebars
{% raw %}<h2>List</h2>
<div class="row">
  {{#each model as |library|}}
    <div class="col-md-4">
      {{#library-item item=library}}
        {{#link-to 'libraries.edit' library.id class='btn btn-success btn-xs'}}Edit{{/link-to}}
        <button class="btn btn-danger btn-xs" {{action 'deleteLibrary' library}}>Delete</button>
      {{/library-item}}
    </div>
  {{/each}}
</div>{% endraw %}
```

We iterate our `model` and we pass deeper in the component that `library` local variable as `item`. The component's variable is always on the left side.

Because this component is a block component, we can add some extra content to the library item footer. In this case, we add an Edit and a Delete button.

You can check your project, you should see the same as before on the Libraries list page, however, the code is cleaner and we have a component, what we can reuse somewhere else as well.

Update our `app/templates/libraries/new.hbs`.

``` handlebars
<!-- app/templates/libraries/new.hbs -->
{% raw %}<h2>Add a new local Library</h2>

<div class="row">

  <div class="col-md-6">
      {{library-item-form item=model buttonLabel='Add to library list' action='saveLibrary'}}
  </div>

  <div class="col-md-4">
      {{#library-item item=model}}
          <br/>
      {{/library-item}}
  </div>

</div>{% endraw %}
```

Update `app/templates/libraries/edit.hbs`.

``` handlebars
{% raw %}<h2>Edit Library</h2>

<div class="row">
    <div class="col-md-6">
      {{library-item-form item=model buttonLabel='Save changes' action='saveLibrary'}}
    </div>

    <div class="col-md-4">
      {{#library-item item=model}}
        <br/>
      {{/library-item}}
    </div>

</div>{% endraw %}
```

Add action to `library-item-form.js`

``` javascript
import Ember from 'ember';

export default Ember.Component.extend({
  buttonLabel: 'Save',

  actions: {
    buttonClicked: function(param){
      this.sendAction('action', param);
    }
  }
});
```

### Merging `edit.hbs` and `new.hbs` to `form.hbs` and use `renderTemplate()` and `setupController()`

As you can see `edit.hbs` and `new.hbs` are almost the same, so we can use the same template in both route.

Let's create a `form.hbs` which will be our common template in Edit and in New page.

``` handlebars
<!-- /app/templates/libraries/form.hbs -->
{% raw %}<h2>{{title}}</h2>

<div class="row">
    <div class="col-md-6">
      {{library-item-form item=model buttonLabel=buttonLabel action='saveLibrary'}}
    </div>

    <div class="col-md-4">
      {{#library-item item=model}}
        <br/>
      {{/library-item}}
    </div>

</div>{% endraw %}
```

For using the above common template, we have to do two things. Firstly we have to set `title` and `buttonLabel` params in our controllers, secondly we have to determine somehow, that our template is not the conventional template, we would like to use something unique. Setting controller params in a Route, we can use `setupController` hook, determining a unique template, we can use `renderTemplate` hook.

With the new two hooks our `app/routes/libraries/new.js` would look like this:

``` javascript
// app/routes/libraries/new.js
import Ember from 'ember';

export default Ember.Route.extend({

  model: function () {
    return this.store.createRecord('library');
  },

  setupController: function (controller, model) {
    this._super(controller, model);

    controller.set('title', 'Create a new library');
    controller.set('buttonLabel', 'Create');
  },

  renderTemplate(controller, model) {
    this.render('libraries/form');
  },

  actions: {
    saveLibrary: function (newLibrary) {
      var _that = this;

      newLibrary.save().then(function (response) {
        _that.transitionTo('libraries');
      })
    },

    willTransition: function (transition) {
      var model = this.controller.get('model');
      if (model.get('isNew')) {
        model.destroyRecord();
      }
    }
  }
});
```

And our `edit.js`

``` javascript
// app/routes/libraries/edit.js
import Ember from 'ember';

export default Ember.Route.extend({

  model: function (params) {
    return this.store.findRecord('library', params.library_id);
  },

  setupController: function (controller, model) {
    this._super(controller, model);

    controller.set('title', 'Edit library');
    controller.set('buttonLabel', 'Save changes');
  },

  renderTemplate(controller, model) {
    this.render('libraries/form');
  },

  actions: {

    saveLibrary: function (newLibrary) {
      var _that = this;

      newLibrary.save().then(function (response) {
        _that.transitionTo('libraries');
      })
    },

    willTransition: function (transition) {

      var model = this.controller.get('model');

      if (model.get('hasDirtyAttributes')) {
        var confirmation = confirm("Your changes haven't saved yet. Would you like to leave this form?");

        if (confirmation) {
          model.rollbackAttributes();
        } else {
          transition.abort();
        }
      }
    }
  }
});
```
You can delete the `edit.hbs` and `new.hbs` from `app/templates/libraries/` folder. We don't need them anymore.

More information about `setupController`: http://emberjs.com/api/classes/Ember.Route.html#method_setupController

More information about `renderTemplate`: http://emberjs.com/api/classes/Ember.Route.html#method_renderTemplate

### Create a tiny bootstrap `nav-link-to` component for `<li><a></a></li>`

Time to clean up our navigation template. We can create a nice component to manage bootstrap `navbar` links properly.

Open your terminal and generate a new component with Ember-CLI.

    $ ember g component nav-link-to

Because we would like just slightly modify the main `LinkComponent`, we should just `extend` that class. There is a `tagName` property, which determines the main tag of a component.

Update `app/components/nav-link-to.js`:

``` javascript
// app/components/nav-link-to.js
import Ember from 'ember';

export default Ember.LinkComponent.extend({
  tagName: 'li'
});
```
Note: don't forget to rewrite `Ember.Component.extend` to `Ember.LinkComponent.extend`.

Our connected template will be the following:

``` handlebars
<!-- app/templates/components/nav-link-to.hbs -->
{% raw %}<a href="">{{yield}}</a>{% endraw %}
```

After that we are ready to use our component and we can update our `navbar.hbs`.

``` handlebars
<!-- app/templates/navbar.hbs -->
{% raw %}<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      {{#link-to 'index' class="navbar-brand"}}Library App{{/link-to}}
    </div>

    <div class="collapse navbar-collapse" id="main-navbar">
      <ul class="nav navbar-nav">
            {{#nav-link-to 'index'}}Home{{/nav-link-to}}
            {{#nav-link-to 'libraries'}}Libraries{{/nav-link-to}}
            {{#nav-link-to 'about'}}About{{/nav-link-to}}
            {{#nav-link-to 'contact'}}Contact{{/nav-link-to}}
      </ul>

      <ul class="nav navbar-nav navbar-right">
          <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Admin<span class="caret"></span></a>
              <ul class="dropdown-menu">
                  {{#nav-link-to 'admin.invitations'}}Invitations{{/nav-link-to}}
                  {{#nav-link-to 'admin.contacts'}}Contacts{{/nav-link-to}}
              </ul>
          </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>{% endraw %}
```

## <a name='lesson-6'></a>Lesson 6

In this lesson we extend our models with `book` and `author`. Setup relation between models. We create a new page, where we using an external js library to generate dummy data to fill up our database automatically.

### Creating some new models and setup relations

In our simple World, we have Libraries. We have Authors, whose could have a couple of books, however a book could be only in one Library. And one book has only one Author.

To generate new models we use Ember-CLI.

Run the followings in your terminal.

```
$ ember g model book title:string releaseYear:date library:belongsTo author:belongsTo
$ ember g model author name:string books:hasMany
```

Add `hasMany` relation to `library` model manually.

``` javascript
import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  address: DS.attr('string'),
  phone: DS.attr('string'),

  books: DS.hasMany('books'),

  isValid: Ember.computed.notEmpty('name'),
});
```

### Create a new Admin page 'Seeder' and download all models in the same route.

Create a new page using Ember-CLI in your terminal:

```
$ ember g route admin/seeder
```

Check `router.js`. A new route should be there which point to `seeder`.

``` javascript
// app/router.js
import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('about');
  this.route('contact');

  this.route('admin', function() {
    this.route('invitations');
    this.route('contacts');
    this.route('seeder');
  });
  this.route('libraries', function() {
    this.route('new');
    this.route('edit', { path: '/:library_id/edit' });
  });
});

export default Router;
```

Extend your `navbar.hbs` with the new page.

``` handlebars
<!-- app/templates/navbar.hbs -->
{% raw %}<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      {{#link-to 'index' class="navbar-brand"}}Library App{{/link-to}}
    </div>

    <div class="collapse navbar-collapse" id="main-navbar">
      <ul class="nav navbar-nav">
            {{#nav-link-to 'index'}}Home{{/nav-link-to}}
            {{#nav-link-to 'libraries'}}Libraries{{/nav-link-to}}
            {{#nav-link-to 'about'}}About{{/nav-link-to}}
            {{#nav-link-to 'contact'}}Contact{{/nav-link-to}}
      </ul>

      <ul class="nav navbar-nav navbar-right">
          <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Admin<span class="caret"></span></a>
              <ul class="dropdown-menu">
                  {{#nav-link-to 'admin.invitations'}}Invitations{{/nav-link-to}}
                  {{#nav-link-to 'admin.contacts'}}Contacts{{/nav-link-to}}
                  {{#nav-link-to 'admin.seeder'}}Seeder{{/nav-link-to}}
              </ul>
          </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>{% endraw %}
```

#### Using `Ember.RSVP.hash()` for downloading more models in the same route

For downloading more models in the same route we have to use `Ember.RSVP.hash()` function in `model` hook.

`RSVP.hash` wraps more promises and return a nicely structured hashed object. More information: http://emberjs.com/api/classes/RSVP.html#method_hash

``` javascript
// app/routes/admin/seeder.js
import Ember from 'ember';

export default Ember.Route.extend({

  model() {
    return Ember.RSVP.hash({
      libraries: this.store.findAll('library'),
      books: this.store.findAll('book'),
      authors: this.store.findAll('author')
    })
  },

  setupController(controller, model) {
    controller.set('libraries', model.libraries);
    controller.set('books', model.books);
    controller.set('authors', model.authors);
  }
});
```

RSVP tries to download all model, it will return with fulfilled state only if all three download were successful.

In the `setupController` hook, we split the model and setup new controller properties.

### Little summary about route`s hooks

You already use a couple of hook in routes, which will be called in certain sequence.

You can play with it and have a little experiment in one of your route.

``` javascript
import Ember from 'ember';

export default Ember.Route.extend({

  init() {
    debugger
  },

  beforeModel(transition) {
    debugger;
  }

  model(params, transition) {
    debugger;
  },

  afterModel(model, transition) {
    debugger;
  },

  activate() {
    debugger;
  },

  setupController(controller, model) {
    debugger;
  },

  renderTemplate(controller, model) {
    debugger;
  }
});
```

If you visit the route, where your above experiment code was inserted, and you open inspector console in your web browser, the code will stop for debugging in each call. You can see what is the sequence of hooks. The above code follows the pattern.

1. `init()` http://emberjs.com/api/classes/Ember.Route.html#method_init
2. `beforeModel(transition)` http://emberjs.com/api/classes/Ember.Route.html#method_beforeModel
3. `model(params, transition)` http://emberjs.com/api/classes/Ember.Route.html#method_model
4. `afterModel(model, transition)` http://emberjs.com/api/classes/Ember.Route.html#method_afterModel
5. `activate()` http://emberjs.com/api/classes/Ember.Route.html#method_activate
6. `setupController(controller, model)` http://emberjs.com/api/classes/Ember.Route.html#method_setupController
7. `renderTemplate(controller, model)` http://emberjs.com/api/classes/Ember.Route.html#method_renderTemplate

### Create number boxes on Admin/Seeder page to see how much data we have in our database

We use a `number-box` component for visualizing numbers on our page. Let's create our fancy component.

```
$ ember g component number-box
```

Setup `css` classes in the component controller.

``` javascript
// app/components/number-box.js
import Ember from 'ember';

export default Ember.Component.extend({

  classNames: ['panel', 'panel-warning']

});
```

And a little html in our component template:

``` handlebars
<!-- app/templates/components/number-box.hbs -->
{% raw %}<div class="panel-heading">
  <h3 class="text-center">{{title}}</h3>
  <h1 class="text-center">{{if number number '...'}}</h1>
</div>{% endraw %}
```

As you see, we can pass in our component two attributes: `title`, `number`.
If we have something in `number` shows that number, if it is empty shows three dots.

Our template is ready, we can use it in our `app/templates/admin/seeder.hbs`

``` handlebars
<!-- app/templates/admin/seeder.hbs -->
{% raw %}<h1>Seeder, our Data Center</h1>

<div class="row">
  <div class="col-md-4">{{number-box title="Libraries" number=libraries.length}}</div>
  <div class="col-md-4">{{number-box title="Authors" number=authors.length}}</div>
  <div class="col-md-4">{{number-box title="Books" number=books.length}}</div>
</div>{% endraw %}
```

If you open your browser now, you will see three boxes with numbers or with three dots. Remember, we setup `libraries`, `authors` and `books` property in our `setupController` hook, if our `model` hook downloaded our data from the server, those variables are not empty. `.length` method will return a number of the size of that array.

### Building forms to generate dummy data.

We have to generate two other components what we gonna use in this page. Actually we will use only one component, but inside that component we will use an other component. This part is a little bit advance, I don't have a detailed explanation here, but you can copy paste the code and try out. I would suggest, you should play with this code, try to understand. However, don't forget, if you have any question, don't hesitate to ping me on Slack or on Twitter.

Run Ember-CLI commands in your terminal.

```
$ ember g component seeder-block
$ ember g component fader-label
```

Insert the following codes in your templates.

``` javascript
// app/components/seeder-block.js
import Ember from 'ember';

export default Ember.Component.extend({

  actions: {
    generateAction() {
      this.sendAction('generateAction');
    },

    deleteAction() {
      this.sendAction('deleteAction');
    }
  }
});
```

``` handlebars
<!-- app/templates/components/seeder-block.hbs -->
{% raw %}<div class="row">
  <div class="col-md-12">
    <h3>{{sectionTitle}}</h3>

    <div class="row">
      <div class="form-horizontal">
        <label class="col-sm-2 control-label">Number of new records:</label>
        <div class="col-sm-2">
          {{input value=counter class='form-control'}}
        </div>
        <div class="col-sm-4">
          <button class="btn btn-primary" {{action 'generateAction'}}>Generate {{sectionTitle}}</button>
          {{#fader-label isShowing=createReady}}Created!{{/fader-label}}
        </div>
        <div class="col-sm-4">
          <button class="btn btn-danger" {{action 'deleteAction'}}>Delete All {{sectionTitle}}</button>
          {{#fader-label isShowing=deleteReady}}Deleted!{{/fader-label}}
        </div>
      </div>

    </div>
  </div>
</div>{% endraw %}

```

``` javascript
// app/components/fader-label.js
import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'span',

  classNames: ['label label-success label-fade'],
  classNameBindings: ['isShowing:label-show'],

  isShowing: false,

  isShowingChanged: Ember.observer('isShowing', function() {
    Ember.run.later(() => {
      this.set('isShowing', false);
    }, 3000);
  })
});

```

``` handlebars
<!-- app/templates/components/fader-label.hbs -->
{% raw %}{{yield}}{% endraw %}
```

We need also a little `scss` snippet.

``` scss
// app/styles/app.scss
@import 'bootstrap';

body {
  padding-top: 20px;
}

html {
  overflow-y: scroll;
}

.library-item {
  min-height: 150px;
}

.label-fade {
  opacity: 0;
  @include transition(all 0.5s);
  &.label-show {
    opacity: 1;
  }
}

```

We have our components, let's insert them in `seeder.hbs`

``` handlebars
<!-- app/templates/admin/seeder.hbs -->
{% raw %}<h1>Seeder, our Data Center</h1>

<div class="row">
  <div class="col-md-4">{{number-box title="Libraries" number=libraries.length}}</div>
  <div class="col-md-4">{{number-box title="Authors" number=authors.length}}</div>
  <div class="col-md-4">{{number-box title="Books" number=books.length}}</div>
</div>

{{seeder-block
    sectionTitle='Libraries'
    counter=librariesCounter
    generateAction='generateLibraries'
    deleteAction='deleteLibraries'
    createReady=libDone
    deleteReady=libDelDone
}}

{{seeder-block
  sectionTitle='Authors with Books'
  counter=authorCounter
  generateAction='generateBooksAndAuthors'
  deleteAction='deleteBooksAndAuthors'
  createReady=authDone
  deleteReady=authDelDone
}}{% endraw %}
```
### Install `faker.js` for dummy data

To generate dummy data we have to install `faker.js`. https://github.com/johnotander/ember-faker

```
$ ember install ember-faker
```

We import `faker` in our models, where we extend each of our models with a `randomize()` function for generating dummy data.

Update your models with the followings.

``` javascript
// app/models/library.js
import DS from 'ember-data';
import Faker from 'faker';

export default DS.Model.extend({
  name: DS.attr('string'),
  address: DS.attr('string'),
  phone: DS.attr('string'),

  books: DS.hasMany('book', {inverse: 'library', async: true}),

  isValid: Ember.computed.notEmpty('name'),

  randomize() {
    this.set('name', Faker.company.companyName() + ' Library');
    this.set('address', this._fullAddress());
    this.set('phone', Faker.phone.phoneNumber());

    // If you would like to use in chain.
    return this;
  },

  _fullAddress() {
    return `${Faker.address.streetAddress()}, ${Faker.address.city()}`;
  }
});

```

``` javascript
// app/models/book.js
import DS from 'ember-data';
import Faker from 'faker';

export default DS.Model.extend({

  title:        DS.attr('string'),
  releaseYear:  DS.attr('date'),

  author:       DS.belongsTo('author', {inverse: 'books', async: true}),
  library:      DS.belongsTo('library', {inverse: 'books', async: true}),

  randomize(author, library) {
    this.set('title', this._bookTitle());
    this.set('author', author);
    this.set('releaseYear', this._randomYear());
    this.set('library', library);

    return this;
  },

  _bookTitle() {
    return `${Faker.commerce.productName()} Cookbook`;
  },

  _randomYear() {
    return new Date(this._getRandomArbitrary(1900, 2015));
  },

  _getRandomArbitrary(min, max) {
    return Math.random() * (max - min) + min;
  }
});

```

``` javascript
// app/models/author.js
import DS from 'ember-data';
import Faker from 'faker';

export default DS.Model.extend({

  name: DS.attr('string'),

  books: DS.hasMany('book', {inverse: 'author'}),

  randomize() {
    this.set('name', Faker.name.findName());
    return this;
  }

});
```

We will implement our actions in our controller.

``` javascript
// app/controllers/admin/seeder.js
import Ember from 'ember';
import Faker from 'faker';

export default Ember.Controller.extend({

  libraries: [],
  books: [],
  authors: [],

  actions: {

    generateLibraries() {
      const counter = parseInt(this.get('librariesCounter'));

      for (let i = 0; i < counter; i++) {
        this.store.createRecord('library').randomize().save().then(() => {
          if (i === counter-1) {
            this.set('librariesCounter', 0);
            this.set('libDone', true);
          }
        });
      }
    },

    deleteLibraries() {
      this._destroyAll(this.get('libraries'));

      this.set('libDelDone', true);
    },

    generateBooksAndAuthors() {
      const counter = parseInt(this.get('authorCounter'));

      for (let i = 0; i < counter; i++) {
        let newAuthor = this.store.createRecord('author');
        newAuthor.randomize()
          .save().then(() => {
             if (i === counter-1) {
               this.set('authorCounter', 0);
               this.set('authDone', true);
             }
          }
        );

        this._generateSomeBooks(newAuthor);
      }
    },

    deleteBooksAndAuthors() {
      this._destroyAll(this.get('books'));
      this._destroyAll(this.get('authors'));

      this.set('authDelDone', true);
    }
  },

  // Private methods

  _generateSomeBooks(author) {
    const bookCounter = Faker.random.number(10);

    for (let j = 0; j < bookCounter; j++) {
      const library = this._selectRandomLibrary();
      this.store.createRecord('book')
        .randomize(author, library)
        .save();
      author.save();
      library.save();
    }
  },

  _selectRandomLibrary() {
    const libraries = this.get('libraries');
    const librariesCounter = libraries.get('length');

    // Create a new array form ids
    const libraryIds = libraries.map((lib) => {return lib.get('id');});
    const randomNumber = Faker.random.number(librariesCounter-1);

    const randomLibrary = libraries.findBy('id', libraryIds[randomNumber]);
    return randomLibrary;
  },

  _destroyAll(records) {
    records.forEach((item) => {
      item.destroyRecord();
    });
  }

});
```
