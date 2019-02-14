---
layout: home
last_modified_at: 14/01/2019
meta_datetime: '2019-01-14'
meta_published: '14 Jan 2019'
title: 'Ember.js Tutorial - From beginner to advance'
identifier: 'library-app'
ember_cli_version: '3.4'
ember_version: '3.4'
node_version: '10.15.0'
---
# Ember.js Tutorial
## Building a complex web application with the latest Ember.js&nbsp;3
<p class="blog-post-meta">Latest update: <time datetime="{{ page.meta_datetime }}" itemprop="datePublished">{{ page.meta_published }}</time> • <span itemprop="author" itemscope itemtype="http://schema.org/Person"><span itemprop="name"><a href='http://zoltan.nz'>Zoltan</a></span></span></p>

Welcome! This is an [Ember.js tutorial](https://yoember.com) from the absolute beginner level. (At the end of the course we touch some advanced topic.) This tutorial is up-to-date in 2019 as well and compatible with Ember v2 and Ember v3. Please note, we use Ember v3.4, which is the latest long term support version. (I would recommend to play with this version at the moment, because we will use Firebase in this course and the latest version of Firebase supports only Ember v3.4 or earlier.)

Please check the [Live Demo](https://library-app.firebaseapp.com) page and play with the app what we are going to build together.

* Live demo: [library-app.firebaseapp.com](https://library-app.firebaseapp.com/)

You can clone the original repository from GitHub and launch on your desktop anytime.

* Original repo: [https://github.com/zoltan-nz/library-app](https://github.com/zoltan-nz/library-app)

If you have any comment, suggestion or you have a question, please feel free to contact me.

* My Twitter: [@zoltan_nz](https://www.twitter.com/zoltan_nz)
* My Website: [zoltan.nz](http://zoltan.nz)
* Ember.js Community Slack: [@zoltan](https://embercommunity.slack.com/messages/general/team/zoltan/)
* Or just leave a message in the comment section [at the bottom of this page](#disqus_thread).

After you finished this tutorial you can learn more advance topics following the README of this repository: 

* ProductApp - a tutorial where we build an online store together with Ember.js, WIP: [https://github.com/zoltan-nz/product-app](https://github.com/zoltan-nz/product-app)

## Contents

* [Lesson 1 - Creating our first static page with Ember.js](#lesson-1)
  * [Add Bootstrap and Sass to Ember.js App](#ember-bootstrap-sass)
* [Lesson 2 - Computed property, actions, dynamic content](#lesson-2)
* [Lesson 3 - Models, saving data in database](#lesson-3)
* [Lesson 4 - Deploy your app and add more CRUD functionality](#lesson-4)
* [Lesson 5 - Data down actions up, using components](#lesson-5)
* [Lesson 6 - Advance model structures and data relationships](#lesson-6)
* [Lesson 7 - CRUD interface for Authors and Books, managing model relationship](#lesson-7)

## Prerequisites

* Node.js: at least v6, but the best if you install the latest long term support version (version 10).

[The best way to install Node.js on Mac, Linux and on Windows]({% post_url 2016-03-20-the-best-way-to-install-node-js %})

* Ember Inspector Chrome Extension

Install Ember Inspector Chrome extension in your Chrome Browser: [Ember Inspector](https://chrome.google.com/webstore/detail/ember-inspector/bmdblncegkenkacieihfhpjfppoconhi?hl=en)

* (Optional but suggested on Mac and Linux) Watchman from Facebook

Install Watchman on Mac: `brew install watchman`
More info: <https://facebook.github.io/watchman/>

Watchman increases the speed of the build process significantly.

## <a name='lesson-1'></a>Lesson 1

This tutorial uses the latest long term supported Ember CLI tool (v{{ page.ember_cli_version }}).

### Install Ember CLI

The following `npm` command installs Ember CLI latest stable version in the global namespace. It generates app with the latest Ember.js and Ember Data. (If you have an earlier version of Ember CLI, the following command automatically updates it to the latest.)

    $ npm install -g ember-cli@{{ page.ember_cli_version }}

You have now a new `ember` command in your console. Check with

    $ ember -v

You should see something similar:

``` bash
version: {{ page.ember_cli_version }}
node: {{ page.node_version }}
os: darwin x64
```

(Node version, npm version and OS version may be different in your configuration.)

Please read more about Ember CLI here: [www.ember-cli.com](http://www.ember-cli.com)

### Create the app

In your terminal, navigate in the folder where you usually create your web applications.
For example, if you have a `projects` folder use

```shell
$ cd ~/projects
```

Inside this folder run the following command.

```shell
$ ember new library-app
```

This command will create the new app for you.

Please change to your new app directory with:

```shell
$ cd library-app
```

Open this folder in your favorite code editor and look around. You will see a few files and folders. Ember CLI is scaffolded for you everything what need to run and create an amazing web application.

### Launch the app

Your skeleton app is ready and you can run it with the following command. Type in your terminal:

```shell
$ ember server
```

Open your new empty app in your browser: <a href="http://localhost:4200" target="_blank">http://localhost:4200</a>

If you use the latest Ember v{{ page.ember_version }}, you should see a page with our happy Tomster and "Congratulations, you made it". This is the Ember Welcome Page.

Well Done! You have your first Ember.js application. :)

You should see the following lines in your `./app/templates/application.hbs`:

```hbs {% raw %}
{{!-- The following component displays Ember's default welcome message. --}}
{{welcome-page}}
{{!-- Feel free to remove this! --}}

{{outlet}}{% endraw %}
```

As it suggested, feel free to remove the first three lines and update it with your own welcome message. ;)

For example, open this file in your favorite editor and add the following html code above the `outlet` line.

```hbs {% raw %}
<h1>Welcome to Ember</h1>

{{outlet}}{% endraw %}
```

With this step, we recreate the same home page, what we had in earlier versions of Ember. Make sure that the development server is still running in your console:

```shell
$ ember server
```

Reload your app in your browser. Our favorite Tomster disappeared but we have a clean welcome message in our amazing app.

You can open Ember Inspector in your Browser. Hope you've already installed it. Ember Inspector exists in Chrome and in Firefox as an extension. After installation you should have a new tab in your developer console in your browser. Check it out, look around. [More details about Ember Inspector here](https://guides.emberjs.com/v{{ page.ember_version }}.0/ember-inspector/installation/).

### <a name="ember-bootstrap-sass"></a>Add Bootstrap and Sass to Ember.js App

Let's add some basic styling to our application. We use Bootstrap with Sass. Ember CLI can install for us add-ons and useful packages. These add-ons simplify our development process, because we don't have to reinvent the wheel, we get more out of the box. You can find various packages, add-ons on these websites: <http://www.emberaddons.com> or <http://www.emberobserver.com>

We install an add-on for Sass and another for Bootstrap.

Exit your `ember server` with `Ctrl+C` in your terminal.

Run the following two commands:

```
$ ember install ember-cli-sass
$ ember install ember-cli-bootstrap-sassy
```

You will see, that your `./package.json` is extended with a couple of lines.

Rename your `app.css` to `app.scss` with the following terminal command or you can use your editor to rename the `./app/styles/app.css` file:

```
$ mv app/styles/app.css app/styles/app.scss
```

Open `./app/styles/app.scss` file in your editor and add the following line:

```scss
@import "bootstrap";
```

Relaunch your app with `ember server`. You should see in the browser, that 'Welcome to Ember' uses Bootstrap default font.

Above steps in a one liner. Copy-paste in your console (without $). This is useful if you create a new project and you would like to add Bootstrap in a second.

```shell
{% raw %}$ ember install ember-cli-sass && ember install ember-cli-bootstrap-sassy && echo '@import "bootstrap";' > ./app/styles/app.scss && rm ./app/styles/app.css{% endraw %}
```

### <a name="navigation-bar"></a>Create a navigation partial

We will use bootstrap navigation bar to create a nice header section for our app.

Update your main template file. Delete the example content and add the following code to your `./app/templates/application.hbs`.

```hbs {% raw %}
<div class="container">
  {{partial 'navbar'}}
  {{outlet}}
</div>{% endraw %}
```

*Just a note. Using `partial` is a little bit older concept. We can migrate them to components, however we learn about components a little bit later. To keep it simple, we just use templates and partials here. It can be one of your homework to update them to components. ;)*

Ember uses handlebar syntax in templates. It is almost the same as plain html, but you could have dynamic elements with `{% raw %}{{}}{% endraw %}`.

You can insert snippets from other templates with the `partial` helper.

The `outlet` helper is a general helper, a placeholder, where deeper level content will be inserted. The `outlet` in `application.hbs` means that almost all content from other pages will appear inside this section. For this reason, `application.hbs` is a good place to determine the main structure of our website. In our case we have a `container` div, a navigation bar, and the real content.

As you already realized, Ember CLI is an amazing tool and help us a lot. It has a `generate` command which can create our skeleton files during the development process. List all the options with `ember generate --help`.

Let's generate a `navbar.hbs` file with the following command in you terminal.

```bash
$ ember generate template navbar
```

You can open `./app/templates/navbar.hbs` in your editor and add the following lines:

```hbs {% raw %}
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

Ember provides a bunch of useful handlebar helpers. The `{% raw %}{{#link-to}}{{/link-to}}{% endraw %}` helps to create links. In this case we use as a block helper. The first parameter is the route name (`index`). Inside the block goes the label of the link. `link-to` uses `<a>` tag as default, but you can set up a different tag with the `tagName` property. We need this slightly hacky solution because of Bootstrap, however later we will implement a [nicer component](#nav-link-to) to manage navigation links.

Launch your application with `ember server`. You should see your new navigation bar in your browser.

You can update your `app.scss` file to add some extra padding to the top. The updated `./app/styles/app.scss` content:

```scss
@import "bootstrap";

body {
  padding-top: 20px;
}
```

### <a name="about-page"></a>Create a new About page and add the link to the menu bar

Let's create a new About page.

Run the following command in your terminal

```bash
$ ember generate route about
```

A new route and template created in your project.

Open your new `./app/templates/about.hbs` file in your editor, delete its content and add the following line:

```html
<h1>About Page</h1>
```

You can launch your app with `ember server` and navigate to `http://localhost:4200/about`, where you should see the newly created `About Page` header message. If you click on `Home` in your menu bar, your page will be empty. Let's fix that.

Create a new `index` template with the following command in your terminal:

    $ ember generate template index

Open in your editor the newly generated `./app/templates/index.hbs` file and add the following:

```html
<h1>Home Page</h1>
```

If you launch your app, you should see the above message on your home page, however we still don't have an `About` link in our menu bar.

Open your `./app/templates/navbar.hbs` and add the following line to the `ul` section under the `Home` link:

```hbs
{% raw %}{{#link-to 'about' tagName="li"}}<a href="">About</a>{{/link-to}}{% endraw %}
```

Your `ul` section in `navbar.hbs` should look like this:

```hbs
{% raw %}<ul class="nav navbar-nav">
  {{#link-to 'index' tagName="li"}}<a href="">Home</a>{{/link-to}}
  {{#link-to 'about' tagName="li"}}<a href="">About</a>{{/link-to}}
</ul>{% endraw %}
```

If you check your app in the browser, you should see `Home` and `About` links in your menu bar. You can click on them and see how the page content and the url are changed. The `active` state of the link changes the style of the menu link automatically as well. However Bootstrap expect the `active` class in `li` and expects an anchor tag inside the `li` tag. For this reason we have to insert that empty anchor around menu labels. We will fix this with a nice component later.

### Homework

Create a `Contact` page. Extend the navigation bar with a "Contact" menu item.

## <a name='lesson-2'></a>Lesson 2

### Coming Soon homepage with an email input box

Let's create a coming soon "jumbotron" on the home page with an email input box, where users can subscribe for a newsletter.

* Bootstrap's jumbotron: <http://getbootstrap.com/components/#jumbotron>
* Bootstrap's forms: <http://getbootstrap.com/css/#forms>

#### Only static html5 and style

Add a static jumbotron, an input box and a button to `/app/templates/index.hbs`.

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

* "Invite me" button should be inactive when input box is empty.
* "Invite me" button should be inactive when the content in the input box is not a valid email address.
* Show a response message after clicking on "Invite me" button.
* Clear the input box after invitation has sent.

#### isDisabled

We can add dynamic values to standard html properties using conditionals. We can use our controller to add or modify the value of a variable, which we use in our template. Check the following solution.

We use a boolean variable, let's call it `isDisabled`, which will help us to turn on and off the `disabled` html attribute on our button. We have access to these variables in our controllers and in our templates.

From the official guide:
"Each template has an associated controller: this is where the template finds the properties that it displays. You can display a property from your controller by wrapping the property name in curly braces."

First, update your `index.hbs` template with this variable.

Add `disabled` property with `{% raw %}{{isDisabled}}{% endraw %}` boolean variable.

```html {% raw %}
<button disabled={{isDisabled}} class="btn btn-primary btn-lg btn-block">Request invitation</button>{% endraw %}
```

Now we can create our index controller (`ember g` is the short version of `ember generate`):

    $ ember g controller index

*Please read more about Ember controllers here: <https://guides.emberjs.com/v{{ page.ember_version}}.0/controllers/>*

*Note: Ember.js still uses controllers, however there were rumors, that the controller layer will be deprecated and removed from Ember.js 3.0. It looks like controllers will stay with us for a while so don't worry too much. For now, we will use controllers to practice some interesting features, but later we will refactor our app and move most of the view related logic inside components.*

Add `isDisabled` property to the controller. Default value is `true`.

```js
//app/controllers/index.js
import Controller from '@ember/controller';

export default Controller.extend({

  isDisabled: true

});
```

If you check your app, you will see that the button is disabled by default. We want to add some logic around this feature. We have to learn a couple of new Ember.js tricks for that.

#### Computed Properties and Observers

Computed Properties and Observers are important features of Ember.js. Please read more about it in the official guide first.

* Computed Properties: <http://guides.emberjs.com/v{{ page.ember_version}}.0/object-model/computed-properties/>
* Observers: <http://guides.emberjs.com/v{{ page.ember_version}}.0/object-model/observers/>

Please note, I will use the new, preferred syntax in our project. You could ask, was there some other syntax before? Yes.

Computed properties and observers still could be written in two ways, however the classic syntax will be deprecated soon, but it is important to know the "old" syntax and the "new" syntax, so when you see older project, you will recognise this pattern.

Previously `.property()` and `.observes()` were attached to the end of the functions. Nowadays we use `Ember.computed()` and `Ember.observer()` functions instead. (Two more things. From Ember v2.17 there is a shorter syntax also. From Ember v3.1 we can simplify further our code. Yey!) Let's see in examples.

Old (with ES5 string concatenation):

```js
//...
fullName: function() {
  return this.get('firstName') + ' ' + this.get('lastName');
}.property('firstName', 'lastName')
//...
```

New (with ES6 string interpolation, which uses back-tick, dollar sign and curly braces), using global import:

```js
import Ember from 'ember';

//...

fullName: Ember.computed('firstName', 'lastName', function() {
  return `${this.get('firstName')} ${this.get('lastName')}`;
})
//...
```

Preferred short syntax from Ember v2.17, using direct import:

```javascript
import { computed } from '@ember/object';

//...

fullName: computed('firstName', 'lastName', function() {
  return `${this.get('firstName')} ${this.get('lastName')}`;
})
//...
```

From Ember v3.1, it will work without `.get()` as well:

```javascript
import { computed } from '@ember/object';

//...

fullName: computed('firstName', 'lastName', function() {
  return `${this.firstName} ${this.lastName}`;
})
//...
```

The `computed()` function could have more parameters. The first parameters are always variables/properties in string format; what we would like to use inside our function. The last parameter is a `function()`. Inside this function we will have access to the properties with `this.get()` or from Ember v3.1 just simply `this.propertyName`. For example, read `firstName` property with `this.get('firstName')` or (from Ember v3.1) `this.firstName` and update properties with `this.set('firstName', 'someNewValue')`. (Please note, we still have to use `this.set()` in the latest Ember also.)

*From Ember version 2.17, we import directly the `computed` function instead of using the global `Ember` namespace. It means, you will use `computed()` mainly in your codebase and not `Ember.computed()`.*

*From Ember version 3.1, we can omit `.get()` in computed properties. However, there are some special cases when we still have to use it. Please read more about this changes here: [ES5 Getters for Computed Properties](https://www.emberjs.com/blog/2018/04/13/ember-3-1-released.html#toc_es5-getters-for-computed-properties-2-of-4).*

Back to our project. Let's play with these new features.

Update the html code with input component syntax and add a `value` to the email input box.

Modify `<input>` line as follow in `index.hbs`, please note we changed our angle brackets to curly braces:

```hbs {% raw %}
{{input type="email" value=emailAddress class="form-control" placeholder="Please type your e-mail address." autofocus="autofocus"}}{% endraw %}
```

As you can see, we use the `emailAddress` variable, or in other words, a "property" where we would like to store the value of the input box.

If you type something in the input box, it will update this variable in the controller as well.

You can use the following code in your controller to demonstrate the differences between computed properties and observers:

```js {% raw %}
//app/controllers/index.js
import { computed, observer } from '@ember/object';
import Controller from '@ember/controller';

export default Controller.extend({

  isDisabled: true,

  emailAddress: '',

  actualEmailAddress: computed('emailAddress', function() { 
    console.log('actualEmailAddress function is called: ', this.get('emailAddress'));
  }),

  emailAddressChanged: observer('emailAddress', function() { 
    console.log('observer is called', this.get('emailAddress')); 
  })

});
{% endraw %}
```

Observers will always be called when the value of the `emailAddress` changes, while the computed property only changes when you go and use that property. Open your app in your browser, and activate Ember Inspector. Click on `/# Routes` section, find the `index` route, and in the same line, under the `Controller` column, you will see an `>$E` sign; click on it. Open the console in Chrome and you will see something like this: `{% raw %}Ember Inspector ($E):  Class {__nextSuper: undefined, __ember_meta__: Object, __ember1442491471913: "ember443"}{% endraw %}`

If you type the following in the console: `$E.get('actualEmailAddress')`, you should see the `console.log` output message defined above inside "actualEmailAddress". You can try out `$E.set('emailAddress', 'example@example.com')` in the console. What do you see?

Please play with the above examples and try to create your own observers and computed properties.

#### isDisabled with Computed Property

We can rewrite our `isDisabled` with computed property as well.

```js
// app/controllers/index.js
import { computed } from '@ember/object';
import Controller from '@ember/controller';

export default Controller.extend({

  emailAddress: '',

  isDisabled: computed('emailAddress', function() {
    return this.get('emailAddress') === '';
  })

});
```

There are a few predefined computed property functions, which saves you some code. In the following example we use `Ember.computed.empty()`, which checks whether a property is empty or not. Please note, from Ember version 2.17 you can directly import the predefined functions, so in our code we can use the short `empty()` function. Don't forget to import it.

```js
// app/controllers/index.js
import Controller from '@ember/controller';
import { empty } from '@ember/object/computed';

export default Controller.extend({

  emailAddress: '',

  isDisabled: empty('emailAddress')

});

```

Try out the above example in your code.

* More about `Ember.computed` options: <https://emberjs.com/api/ember/{{ page.ember_version}}/modules/@ember%2Fobject> (Check all the methods at `@ember/object/computed` section.)

#### isValid

Let's go further. It would be a more elegant solution if we only enabled our "Request Invitation" button when the input box contained a valid email address.

We'll use the `Ember.computed.match()` or `match()` short computed property function to check the validity of the string. But `isDisabled` needs to be the negated version of this `isValid` computed property. We can use the `Ember.computed.not()` or `not()` for this.

```js
// app/controllers/index.js
import Controller from '@ember/controller';
import { match, not } from '@ember/object/computed';

export default Controller.extend({

  emailAddress: '',

  isValid: match('emailAddress', /^.+@.+\..+$/),
  isDisabled: not('isValid')

});
```
Great, it works now as expected. You see, we can write really elegant code with Ember.js, can't we? ;)

#### Adding our first Action

Great we have an input box and a button on our screen, but it does nothing at the moment. Let's implement our first action.

Update the `<button>` line in `index.hbs` to read like this.

```hbs {% raw %}
<button class="btn btn-primary btn-lg btn-block" disabled={{isDisabled}} {{action 'saveInvitation'}}>Request invitation</button>{% endraw %}
```

You can try it out in your browser and see that if you click on the button, you will get a nice error message, alerting you that you have to implement this action in your controller. Let's do that.

```js
// app/controllers/index.js
import Controller from '@ember/controller';
import { match, not } from '@ember/object/computed';

export default Controller.extend({

  responseMessage: '',
  emailAddress: '',

  isValid: match('emailAddress', /^.+@.+\..+$/),
  isDisabled: not('isValid'),

  actions: {

    saveInvitation() {
      alert(`Saving of the following email address is in progress: ${this.get('emailAddress')}`);
      this.set('responseMessage', `Thank you! We've just saved your email address: ${this.get('emailAddress')}`);
      this.set('emailAddress', '');
    }
  }

});

```
If you click on the button, the `saveInvitation` action is called and shows an alert box, sets up a `responseMessage` property, and finally deletes the content of `emailAddress`.

We have to show the response message. Extend your template.

```hbs {% raw %}
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
       <button class="btn btn-primary btn-lg btn-block" {{action 'saveInvitation'}} disabled={{isDisabled}}>Request invitation</button>
     </div>
   </div>

   {{#if responseMessage}}
     <div class="alert alert-success">{{responseMessage}}</div>
   {{/if}}

   <br/><br/>

</div>{% endraw %}
```
We use the `{% raw %}{{#if}}{{/if}}{% endraw %}` handlebar helper block to show or hide the alert message. Handlebar conditionals are really powerful. You can use `{% raw %}{{else}}{% endraw %}` as well.

* More about conditionals in templates: <http://guides.emberjs.com/v{{ page.ember_version}}.0/templates/conditionals/>

Brilliant. You learned a lot about Ember.js and you have just implemented these great features.

### Homework

It is time to practice what you have just learned.

Let's start with a simple task. Instead of directly implement the "Coming Soon" header text in the `app/templates/index.hbs`, replace it with a property in the `app/controllers/index.js`. (Hint: Create a new simple property in the controller, for example: `headerMessage: 'Comming Soon'` and use this constant in the template with the double curly braces syntax: `{% raw %}<h1>{{headerMessage}}</h1>{% endraw %}`.)

The next task is more complex. You already have an amazing `Contact` page, where we would like to add a contact form. Here's what your solution should be able to do or should look like.

* In this contact form will be two fields; one field for an email address and another field for a text message.
* There will be a “Send message” button.
* This button should be active only if the email address field isn't empty and is valid, and there is some message in the text box.
* After clicking on the “Send message” button, an alert should appear with the email address and the message.
* When you close the alert message, the form should be cleared and a success message should appear on the page in a green box. This message could be something like, "We got your message and we'll get in touch soon".

Hint: you already have a `contact.hbs` template but you need a controller for it, to manage its logic.

Bonus point if you can add validation to the `textarea`. One option: the textarea should not be empty. Another option: the length of the message has to be at least 5 characters long.

```hbs
{% raw %}{{textarea class="form-control" placeholder="Your message. (At least 5 characters.)" rows="7" value=message}}{% endraw %}
```

Short version of computed property for `greater than or equal`:

```js
Ember.computed.gte('yourProperty', number)
```

(Please note, it is `computed.gte` and not `computed.get`.)

You can use the latest syntax with importing `gte` function directly:

```javascript
import { gte } from '@ember/object/computed';

//...

isLongEnough: gte("yourProperty.length", 5),

//...
```

(Tip: You can get a string computed property length with `.length`. If your computed property is `message`, the length of that message is `message.length`.)

If you have two computed properties, and both must be `true`, you can use a third computed property to compute the `and` logic.

```js
Ember.computed.and('firstComputedProperty', 'secondComputedProperty')
```

With the latest syntax:

```js
import { and } from '@ember/object/computed';

//...

isBothTrue: and('firstComputedProperty', 'secondComputedProperty'),

//...
```

* In terms of feedback on a form, there is a really cool solution on bootstrap: <https://getbootstrap.com/docs/3.3/css/#forms-control-validation> (Check the "With optional icons" section.)

Please try to implement the above requirements. When you're finished, you can check out my repository (the contact logic in my repository is already located at `library-app/app/models/contact.js` because of how we refactor things later, however you can see in this earlier commit, that validation was [placed in the controller](https://github.com/zoltan-nz/library-app/blob/60ab93f51e8f488cde6c2e52d28a978370323858/app/controllers/contact.js)). I am pretty sure that your solution will be much better than mine. ;)

## <a name='lesson-3'></a>Lesson 3

### Our first Ember.js Model

We ask for email addresses on the home page, but we don't save them in the database at the moment. It is time to implement this feature in our website.

* Please read the detailed introduction on Ember.js website about Ember.js Models: <http://guides.emberjs.com/v{{ page.ember_version}}.0/models/>

Let's create our first model where we save email addresses for invitation. Type the following command in your command line.

    $ ember g model invitation email:string

The above Ember Generator created a new model file (and a skeleton test file). Our first model:

```js
// app/models/invitation.js
import DS from 'ember-data';

export default DS.Model.extend({
  email: DS.attr('string')
});
```

It means, if we use the `invitation` model, it will have an `email` property, which data type is a string. 

Hope you read about `store` in The Official Guide. Let's use it.

Update your `app/controllers/index.js` controller action. Instead of showing a useless alert message, we try to save our data.

```js {% raw %}
// app/controllers/index.js
import Controller from '@ember/controller';
import { match, not } from '@ember/object/computed';

export default Controller.extend({

  headerMessage: 'Coming Soon',
  responseMessage: '',
  emailAddress: '',

  isValid: match('emailAddress', /^.+@.+\..+$/),
  isDisabled: not('isValid'),

  actions: {

    saveInvitation() {
      const email = this.get('emailAddress');

      const newInvitation = this.store.createRecord('invitation', { email: email });
      newInvitation.save();

      this.set('responseMessage', `Thank you! We have just saved your email address: ${this.get('emailAddress')}`);
      this.set('emailAddress', '');
    }
  }

}); {% endraw %}
```

Open the app in your browser, and open the browser's console. Try to save an invitation email address on the home page. You will see an error message in the console.

Ember.js tried to send that data to a server, but we don't have a server yet. Let's build one.

### Setup a server on Firebase

Firebase is a server and API service. Try it out and you will realize how simple and easy to use. <http://firebase.google.com>

1. Create an account on Firebase website.
2. You can learn more about EmberFire addon, which connects your Ember App to the Firebase service here: 
    * [EmberFire Quick Start](https://github.com/firebase/emberfire/blob/master/docs/quickstart.md) 
    * [EmberFire Guide](https://github.com/firebase/emberfire/blob/master/docs/guide/README.md)
3. First, run the following command in your terminal to install EmberFire addon: `ember install emberfire`
4. You will see instructions in the console. We have to manually add a few lines to our configuration file. Copy and paste those lines in `config/environment.js`.
5. Go back to Firebase and create a project there. When your new Firebase project ready, click on "</> Add Firebase to your web app" icon on Overview page. Check those params in the popup window ("apiKey", "authDomain", etc.) and copy-paste the values in your `config/environment.js` file in your Ember application accordingly.

```js
// config/environment.js

module.exports = function(environment) {
  let ENV = {
    modulePrefix: 'library-app',
    environment,
    rootURL: '/',
    locationType: 'auto',

    firebase: {
      apiKey: 'xyz',
      authDomain: 'YOUR-FIREBASE-APP.firebaseapp.com',
      databaseURL: 'https://YOUR-FIREBASE-APP.firebaseio.com',
      projectId: 'project-12341234',
      storageBucket: 'YOUR-FIREBASE-APP.appspot.com',
      messagingSenderId: '1234'
    },

    // if using ember-cli-content-security-policy
    contentSecurityPolicy: {
      'script-src': "'self' 'unsafe-eval' apis.google.com",
      'frame-src': "'self' https://*.firebaseapp.com",
      'connect-src': "'self' wss://*.firebaseio.com https://*.googleapis.com"
    },

    EmberENV: {
      FEATURES: { ...
```

Please note, that Firebase closes the database by default, you have to manually add permissions. Please read [this section on Firebase website](https://firebase.google.com/docs/database/security/quickstart).

Change your database to public, so we don't have to implement authentication in this stage. To do this, navigate to your Firebase Console, select your new app, click "Database" from the left menu and click on "Rules" tab. Change the content in the rules editor to read:

```json
{
  "rules": {
    ".read": true,
    ".write": true
  }
}
```

Try out Request Invitation button again, check your browser's console messages and open the Firebase website, and check your app dashboard. You will see, that the email address, which you just saved on your home page, is sent to Firebase and it is saved on the server.

* Remember to restart your Ember server, otherwise you'll have problems with the newly installed EmberFire addon.

Well done!

*Please note that your database is public with the above settings. This is fine for practicing and learning. However you should implement authentication and using a closed database when you build your next real application. You can learn more about it in the official [EmberFire Guide](https://github.com/firebase/emberfire/blob/master/docs/guide/README.md).*

### Promise and the `this` context in javascript (+ playing with ES5 and ES6 a little)

Promises are a unique asynchronous feature in javascript. Basically, they're objects that haven't completed yet, but are expected to in the future. You can read more about promises on the Mozilla website: <https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Promise>

In our code, we use a Promise: `.save()`

The `save` method on Ember Data Model is a `Promise`. It promises us that it is trying to save our data. It could be successful or maybe return with an error.

We can catch the result of a `Promise` with a chained `.then()`. In our example:

```js
newInvitation.save().then(function(response) {
  console.log('Email address is saved.')
})
```

If the saving process is successful, 'fulfilled', then we will get back a response from the server, which we can catch in our function parameter.

We have to relocate the code that displays our success message to be inside this new function, because we would like to show the success message only when the data is actually saved.

If you simply copy and paste the snippet below (which uses ES5 JavaScript syntax), you will see that the code does not work as expected. (In the following snippet, I mix the ES5 `function` and ES6 string interpolation syntax. It is not nice.)

```js
newInvitation.save().then(function(response) {
  this.set('responseMessage', `Thank you! We have just saved your email address: ${this.get('emailAddress')}`);
  this.set('emailAddress', '');
})
```

In javascript, `this` always points to the object that wraps around it. In the above example, `this` will be undefined because we are inside the function after the Promise. Please learn more about it here: <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/this>

This kind of problem is solved nicely in ES6/ES2015, the new JavaScript, which is what I mainly use in this tutorial. However, it's not a problem if you see the old, traditional way also. We'll look at it for just a second.

In ES5 syntax, we have to save the controller context (the controller's `this`) in a local variable. We can set the controller's `this` as the variable `_that` so we can use it inside our `then`.

In ES5 syntax our controller would look like this. (You don't have to use this code in your project. I will show the preferred ES6/ES2015 version below.)

```js
import Ember from 'ember';

export default Ember.Controller.extend({

    headerMessage: 'Coming Soon',
    responseMessage: '',
    emailAddress: '',

    isValid: Ember.computed.match('emailAddress', /^.+@.+\..+$/),
    isDisabled: Ember.computed.not('isValid'),

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

We save the `this` controller context in a `_that` local variable. We use this local variable inside our function after the `save()` Promise. The above example uses the `response` from Firebase and shows the `id` of the generated database record. The ES5 solution uses the `var` declaration a lot, but in ES2015 JavaScript, we don't use `var` anymore; only `let` and `const`. Good bye `var` and goodbye `_that`! ;)

Let's look at the cleaner ES2015 version. (You can use this code in your project.)

```js
// app/controllers/index.js
import Controller from '@ember/controller';
import { match, not } from '@ember/object/computed';

export default Controller.extend({

  headerMessage: 'Coming Soon',
  responseMessage: '',
  emailAddress: '',

  isValid: match('emailAddress', /^.+@.+\..+$/),
  isDisabled: not('isValid'),

  actions: {

    saveInvitation() {
      const email = this.get('emailAddress');

      const newInvitation = this.store.createRecord('invitation', { email });

      newInvitation.save().then(response => {
        this.set('responseMessage', `Thank you! We saved your email address with the following id: ${response.get('id')}`);
        this.set('emailAddress', '');
      });

    }
  }

});
```

You can see the new `=>` syntax here. We don't need to use the `function` keyword so much. The context of the `saveInvitation()` method is automatically passed deeper, into our asynchronous callback function. Now you can just use a simple `this`. Much nicer and cleaner. Do you like it?

After `save()`, the model from the server will be sent to the callback as `response`. This model object will contain the `id` of our model. The `id` comes from our database. You can use it in the response message.

In ES2015 you can use shorthand property names also. Instead of writing `{ email: email }`, you can just use `{ email }`. As you see in the arrow function, you can omit braces if the function has only one param. Instead of `.then((response) => {})`, we use only `.then(response => { })`.

Great, our home page is ready.

### Create an Admin page

We would like to list out from the database the persisted email addresses.

Let's create a new route and page what we can reach with the following url: `http://localhost:4200/admin/invitations`

    $ ember g route admin/invitations

Add this new page to the `navbar.hbs` with a dropdown.

```hbs
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
          <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
            Admin<span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
          {{#link-to 'admin.invitations' tagName="li"}}<a href="">Invitations</a>{{/link-to}}
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>{% endraw %}
```

Add a table to `app/templates/admin/invitations.hbs`

```hbs
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

We use the `{% raw %}{{#each}}{{/each}}{% endraw %}` handlebar block helper to generate a list. The `model` variable will contain an array of invitations which we will retrieve from the server. Ember.js automatically populates responses from the server, however we have not implemented this step yet.

Let's retrieve our data from the server using a Route Handler and Ember Data.

* Please start here and read the official guide about Route's Model: <http://guides.emberjs.com/v{{ page.ember_version}}.0/routing/specifying-a-routes-model/>

Add the following code to your `app/routes/admin/invitations.js` file:

```js
// app/routes/admin/invitations.js
import Route from '@ember/routing/route';

export default Route.extend({

  model() {
    return this.store.findAll('invitation');
  }

});
```

Launch your app and check your table in Admin. What do you think? :)

### CRUD interface for libraries

We will implement a new section in our app, where we can create new libraries and list the previously created data.

Firstly we create our `library` model.

    $ ember g model library name:string address:string phone:string

Secondly we create our new route. At the moment we'll do it without Ember CLI; just manually add the following lines to our `router.js`:

```js
// app/router.js

import EmberRouter from '@ember/routing/router';
import config from './config/environment';

const Router = EmberRouter.extend({
  location: config.locationType,
  rootURL: config.rootURL
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

Now we create 3 new templates. Our main `libraries.hbs`, a `libraries/index.hbs` for displaying the list, and a `libraries/new.hbs` for a library creation form.

    $ ember g template libraries
    $ ember g template libraries/index
    $ ember g template libraries/new

Update your `navbar.hbs` main navigation section as follows.

```hbs
<!-- app/templates/navbar.hbs -->
{% raw %}<ul class="nav navbar-nav">
  {{#link-to 'index' tagName="li"}}<a href="">Home</a>{{/link-to}}
  {{#link-to 'libraries' tagName="li"}}<a href="">Libraries</a>{{/link-to}}
  {{#link-to 'about' tagName="li"}}<a href="">About</a>{{/link-to}}
  {{#link-to 'contact' tagName="li"}}<a href="">Contact</a>{{/link-to}}
</ul>{% endraw %}
```

Add a submenu to `libraries.hbs`

```hbs
<!-- app/templates/libraries.hbs -->
{% raw %}<h1>Libraries</h1>

<div class="well">
  <ul class="nav nav-pills">
    {{#link-to 'libraries.index' tagName="li"}}<a href="">List all</a>{{/link-to}}
    {{#link-to 'libraries.new' tagName="li"}}<a href="">Add new</a>{{/link-to}}
  </ul>
</div>

{{outlet}}{% endraw %}
```

Check your app; you should see a new menu item, and a submenu with two items under `/libraries`.

The other two templates should have the following content.

```hbs
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

We generate a list from our model which will be retrieved in the route. We are using `panel` style from bootstrap here.

```hbs
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

We use `model` as our value store. You will soon see that our model will be created in the route. The action attached to the submit button will call a `saveLibrary` function that we'll pass the `model` parameter to.

In your `app/routes` folder create `libraries` folder and add two js files: `index.js` and `new.js`

```js
// app/routes/libraries/index.js
import Route from '@ember/routing/route';

export default Route.extend({

  model() {
    return this.store.findAll('library');
  }

});
```

In the route above, we retrieve all the library records from the server.

```js
// app/routes/libraries/new.js
import Route from '@ember/routing/route';

export default Route.extend({

  model() {
    return this.store.createRecord('library');
  },

  actions: {

    saveLibrary(newLibrary) {
      newLibrary.save().then(() => this.transitionTo('libraries'));
    },

    willTransition() {
      // rollbackAttributes() removes the record from the store
      // if the model 'isNew'
      this.controller.get('model').rollbackAttributes();
    }
  }
});
```

In the above route's model method, we create a new record and that will be the `model`. It automatically appears in the controller and in the template. In the `saveLibrary` action we accept a parameter and we save that model, and then we send the application back to the Libraries home page with `transitionTo`.

There is a built-in Ember.js action (event) called `willTransition` that is called when you leave a page (route). In our case, we use this action to reset the model if we haven't saved it in the database yet.

As you can see, we can access the controller from the route handler using `this.controller`, however we don't have a real controller file for this route (`/libraries/new.js`). Ember.js's dynamic code generation feature automatically creates controllers and route handlers for each route. They exists in memory. In this example, the `model` property exists in this "virtual" controller and in our template, so we can still "destroy" it.

Open your browser and please check out these automatically generated routes and controllers in Ember Inspector, under the "Routes" section. You will see how many different elements are dynamically created.

What is that nice one liner in our `saveLibrary()` method?

```js
newLibrary.save().then(() => this.transitionTo('libraries'));
```

In ES2015, with the `=>` [syntax](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions#Syntax), if we only have one line of code (like `return` + something) we can use a cleaner structure, without curly braces and `return`.

Update: In a previous version we had the following code in `willTransition()`.

```js
willTransition() {
  let model = this.controller.get('model');

  if (model.get('isNew')) {
    model.destroyRecord();
  }
}
```
Thanks for Kiffin's [comment](#disqus_thread), we have a simpler solution. Using `rollbackAttributes()` is cleaner. It destroys the record automatically if it is new.

### Homework

**Option 1:** Further improve your Contact Page.

1. Create a `contact` model with `email` and `message` fields.
2. Save the model on the server when someone clicks on the "Send" button on the Contact form. Update your `contact.js` controller to contain validations and actions.
3. Create an Admin page under `http://localhost:4200/admin/contacts`
4. List all saved messages in a table.

**Option 2:** Refactor your app's contact section with usage of model in route.

1. Move contact validation into the contact model.
2. Copy and paste the actions from the controller to the route and try sending a message. Why don't the message and email boxes clear? Refactor it so they do clear. You'll also need to correct the same problem in the validation code you moved to the contact model.
3. Remove the contact controller.

## <a name='lesson-4'></a>Lesson 4

### Deploy your app using Firebase Hosting service

Follow the [guide on Firebase](https://firebase.google.com/docs/hosting/quickstart):

    $ npm install -g firebase-tools
    $ ember build --prod
    $ firebase login
    $ firebase init

Questions and answers:

* What Firebase CLI features do you want to setup for this folder? ==> Hosting

* What Firebase project do you want to associate as default? ==> Select your project.

* What file should be used for Database Rules? ==> Just accept the `database.rules.json` with hitting Return/Enter.

* What do you want to use as your public directory? ==> Type: `dist`, because we would like to publish the content from our `dist` folder.

* Configure as a single-page app (rewrite all urls to /index.html)? ==> Answer: YES (Please note, the default answer would be N, so you have to type YES.)

* File dist/index.html already exists. Overwrite? ==> NO!!! Accept the default NO.

There is a new `firebase.json` file in your project folder, check it out:

```json
{
  "database": {
    "rules": "database.rules.json"
  },
  "hosting": {
    "public": "dist",
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"
      }
    ]
  }
}
```

And deploy:

    $ firebase deploy

Check your app.

    $ firebase open

Select `Hosting: Deployed Site`

It's live! :-D Congratulations!

### Add Delete, Edit button and Edit route

#### Upgrading the library list view to a grid view

Let's upgrade our `app/templates/libraries/index.hbs` to show a nice grid layout. We have to tweak our stylesheet a little bit as well. You can see below that there are two buttons in `panel-footer`. The first button is a link to the Edit screen, and the second is a Delete button with the action `deleteLibrary`. We send `library` as a parameter to that action.

```hbs
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

If you try to launch the app now, you'll get an error message, because we haven't implemented the `libraries.edit` route or the `deleteLibrary` action. Let's implement these.

#### Duplicate some code, create edit.js and edit.hbs

Manually add the new `edit` route to `router.js`. We'll set up a unique `path:` in the second parameter of `this.route()`. Because there is a `:` sign before the `library_id`, that part of the url will be copied as a variable, available as a param in our routes. For example, if the url is `http://example.com/libraries/1234/edit`, then `1234` will be passed as a param to the route so we can use it to fetch that specific model.

```js
// app/router.js
import EmberRouter from '@ember/routing/router';
import config from './config/environment';

const Router = EmberRouter.extend({
  location: config.locationType,
  rootURL: config.rootURL
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

After inserting this extra line in our router, it's time to create our `app/routes/libraries/edit.js`. You can use Ember CLI or you can create it manually. The code should look like the following. I'll explain more below.

```js
// app/routes/libraries/edit.js
import Route from '@ember/routing/route';

export default Route.extend({

  model(params) {
    return this.store.findRecord('library', params.library_id);
  },

  actions: {

    saveLibrary(library) {
      library.save().then(() => this.transitionTo('libraries'));
    },

    willTransition(transition) {

      let model = this.controller.get('model');

      if (model.get('hasDirtyAttributes')) {
        let confirmation = confirm("Your changes haven't saved yet. Would you like to leave this form?");

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

A lot of things happening here.

First of all, in the `model` function, we have a `params` parameter. `params` will contain that `id` from the url. We can access it with `params.library_id`. The `this.store.findRecord('library', params.library_id);` line downloads the single record from the server with the given `id`. The `id` comes from the url.

We added two actions as well. The first will save the changes and then redirect the user to the main `libraries` page.

The second event-action will be called when we are trying to leave the page, because we were redirected in the `saveLibrary` action or the user clicked on a link on the website. In the first case, the changes are already saved, but in the second case, the user may have modified something in the form but not saved it. This is known as "dirty checking". We can read the `model` from the controller, and use Ember Model's `hasDirtyAttributes` computed property to check whether something was changed in the model. If so, we popup an ugly confirmation window. If the user would like to leave the page, we just rollback the changes with `model.rollbackAttributes()`. If the user would like to stay on the page, we abort the transition with `transition.abort()`. You can see that we use the `transition` variable, which is initiated as a param in the `willTransition` function. Ember.js automatically provides this for us.

Our template is still missing. Let's use our `new.hbs` and duplicate the code in `edit.hbs`, with a few changes. We will fix this problem later with reusable "components", because code duplication is not elegant.

```hbs
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

If you launch your app, it should work; you are able to edit the information from a library. You can see the "dirty checking" if you modify the data in the form, and then click on a link somewhere (ex. a link on the menu) without saving the form data.

#### Add delete action

The delete action is still missing. Let's update `app/routes/libraries/index.js`

```js
// app/routes/libraries/index.js
import Route from '@ember/routing/route';

export default Route.extend({

  model() {
    return this.store.findAll('library');
  },

  actions: {

    deleteLibrary(library) {
      let confirmation = confirm('Are you sure?');

      if (confirmation) {
        library.destroyRecord();
      }
    }
  }

})
```

### Homework

You can add delete buttons to the lists on your Admin pages, so you can delete invitations and contact messages. Another nice improvement would be to clean up `app/controllers/index.js` and add a `createRecord` in the model method of `app/routes/index.js`. It would be similar to the `libraries/new.js` route.

## <a name='lesson-5'></a>Lesson 5

### Cleaning up our templates with components

First of all, please read more about Components in the Ember.js Guide: <http://guides.emberjs.com/v{{ page.ember_version}}.0/components/defining-a-component/>

We can generate a component with `ember g component`. Let's create two components. One for the library panel, and one for forms.

```
$ ember g component library-item
$ ember g component library-item-form
```

Each command generates a javascript file and a handlebars file. The javascript part sits in the `app/components/` folder, the template in `app/templates/components/`.

We can insert the following code into our `library-item` template.

```hbs
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

You can see that this code is quite similar to what we have in `app/templates/libraries/index.hbs`, however instead of `model` we use `item`.

The most important concept in terms of components is that they are totally independent from the context. They don't know "other things", other variables. They only know what they originally have and what's passed inside with attributes.

We have a `{% raw %}{{yield}}{% endraw %}` which means that we can use this component as a block component. The code that this component wraps around will be injected inside the `{% raw %}{{yield}}{% endraw %}`.

For example:

```hbs
{% raw %}{{#library-item item=model}}
  Closed
{{/library-item}}{% endraw %}
```

In this case the `Closed` text will appear in the panel footer.

Let's add html to our `library-item-form` component as well.

```hbs
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
            <button type="submit" class="btn btn-default" {{action 'buttonClicked' item}} disabled={{unless item.isValid true}}>{{buttonLabel}}</button>
        </div>
    </div>
</div>{% endraw %}
```

This code is almost identical to the code we used multiple times in `libraries/new.hbs` and `libraries/edit.hbs`.

A tiny improvement is to add a little validation to our `library` model. Please update `app/models/library.js` to include this basic validation, where we check that the `name` is not empty. (Don't forget to import Ember on the top of the file.)

```js
// app/models/library.js
import DS from 'ember-data';
import { notEmpty } from '@ember/object/computed';

export default DS.Model.extend({

  name: DS.attr('string'),
  address: DS.attr('string'),
  phone: DS.attr('string'),

  isValid: notEmpty('name')
});
```

Time to clean up our templates using these new components.

Using the `library-item` component in `app/templates/libraries/index.hbs` reduces the amount of code and makes our template cleaner.

```hbs
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

We iterate through each `library` in our `model`, and then pass that `library` local variable as `item` to the `library-item` component. The name of the component's variable is always on the left side of the assignment.

Because this component is a block component, we can add some extra content to the library item footer. In this case, we add Edit and Delete buttons.

If you check your app in a browser, the Libraries list page should look the same as before, however, the code is cleaner and we have a component that we can reuse elsewhere.

Update our `app/templates/libraries/new.hbs`.

```hbs
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

Let's update `app/templates/libraries/edit.hbs`.

```hbs
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

Add the `buttonClicked` action to `library-item-form.js`.

```js
import Component from '@ember/component';

export default Component.extend({
  buttonLabel: 'Save',

  actions: {

    buttonClicked(param) {
      this.sendAction('action', param);
    }

  }
});
```

### Merge `edit.hbs` and `new.hbs` into `form.hbs` and use `renderTemplate()` and `setupController()`

`edit.hbs` and `new.hbs` are almost the same, so we can use the same template in both routes.

Let's create a `form.hbs` which will be our common template in Edit and in New page.

```hbs
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

To use the common template above, we have to do two things. First, we have to set the `title` and `buttonLabel` params in our controllers. Second, we have to let Ember know not to look for the default template based on the current route (e.x. in the route `libraries/new`, by default Ember looks for the template located at `templates/libraries/new.hbs`). To set controller params in a Route, we can use the `setupController` hook. For setting a non-default template location, we can use the `renderTemplate` hook.

With these two new hooks, our `app/routes/libraries/new.js` should look like this:

```js
// app/routes/libraries/new.js
import Route from '@ember/routing/route';

export default Route.extend({

  model() {
    return this.store.createRecord('library');
  },

  setupController(controller, model) {
    this._super(controller, model);

    controller.set('title', 'Create a new library');
    controller.set('buttonLabel', 'Create');
  },

  renderTemplate() {
    this.render('libraries/form');
  },

  actions: {

    saveLibrary(newLibrary) {
      newLibrary.save().then(() => this.transitionTo('libraries'));
    },

    willTransition() {
      let model = this.controller.get('model');

      if (model.get('isNew')) {
        model.destroyRecord();
      }
    }
  }
});
```

And our `edit.js`

```js
// app/routes/libraries/edit.js
import Route from '@ember/routing/route';

export default Route.extend({

  model(params) {
    return this.store.findRecord('library', params.library_id);
  },

  setupController(controller, model) {
    this._super(controller, model);

    controller.set('title', 'Edit library');
    controller.set('buttonLabel', 'Save changes');
  },

  renderTemplate() {
    this.render('libraries/form');
  },

  actions: {

    saveLibrary(library) {
      library.save().then(() => this.transitionTo('libraries'));
    },

    willTransition(transition) {
      let model = this.controller.get('model');

      if (model.get('hasDirtyAttributes')) {
        let confirmation = confirm("Your changes haven't saved yet. Would you like to leave this form?");

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
You can delete `edit.hbs` and `new.hbs` from the `app/templates/libraries/` folder. We don't need them anymore.

More information about `setupController`: <http://emberjs.com/api/classes/Ember.Route.html#method_setupController>

More information about `renderTemplate`: <http://emberjs.com/api/classes/Ember.Route.html#method_renderTemplate>

### <a name='nav-link-to'></a>Create a tiny bootstrap `nav-link-to` component for `<li><a></a></li>`

Time to clean up our navigation template. We'll create a nice component that properly manages bootstrap `navbar` links.

Open your terminal and generate a new component with Ember CLI.

    $ ember g component nav-link-to

Because we would like to just slightly modify the built-in `LinkComponent`, we should just `extend` that class. We can utilize the `tagName` property, which determines the main tag of a component.

Update `app/components/nav-link-to.js`:

```js
// app/components/nav-link-to.js
import LinkComponent from '@ember/routing/link-component';

export default LinkComponent.extend({
  tagName: 'li'
});
```
Note: don't forget to change the import statement from `import Component from '@ember/component'` to `import LinkComponent from '@ember/routing/link-component'` and `Component.extend` to `LinkComponent.extend`.

The corresponding `nav-link-to` template will be the following:

```hbs
<!-- app/templates/components/nav-link-to.hbs -->
{% raw %}<a href="">{{yield}}</a>{% endraw %}
```

Now we are ready to use our component in our `navbar.hbs`.

```hbs
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
          <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
            Admin<span class="caret"></span>
          </a>
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

*Sidenote*: If you have to solve this problem in a real application, I published an [Ember Addon](https://www.emberobserver.com/addons/ember-bootstrap-nav-link), which automatically adds this component to your project, it is more complex, please use that one. You can check the source code on [Ember Bootstrap Nav Link](https://github.com/zoltan-nz/ember-bootstrap-nav-link) repository.

## <a name='lesson-6'></a>Lesson 6

In this lesson, we'll add the models `book` and `author`, and set up relations between models. We'll also create a new page where we can generate dummy data with an external javascript library to fill up our database automatically.

### Creating some new models and setting up relations

In our simple World, we have Libraries, and we have Authors (who can have a few Books). A Book can only be in one Library, and each Book has only one Author.

To generate the new models, we'll use Ember CLI.

Run the following in your terminal.

```shell
$ ember g model book title:string releaseYear:date library:belongsTo author:belongsTo
$ ember g model author name:string books:hasMany
```

Now add a `hasMany` relation to the `library` model manually.

```js
// app/models/library.js
import DS from 'ember-data';
import { notEmpty } from '@ember/object/computed';

export default DS.Model.extend({

  name: DS.attr('string'),
  address: DS.attr('string'),
  phone: DS.attr('string'),

  books: DS.hasMany('book'),

  isValid: notEmpty('name'),
});
```

### Create a new Admin page 'Seeder' and retrieve multiple models in the same route.

Create a new page using Ember CLI in your terminal:

```shell
$ ember g route admin/seeder
```

Check `router.js`. A new route should be there which points to `seeder`.

```js
// app/router.js
import EmberRouter from '@ember/routing/router';
import config from './config/environment';

const Router = EmberRouter.extend({
  location: config.locationType,
  rootURL: config.rootURL
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

```hbs
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
          <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
            Admin<span class="caret"></span>
          </a>
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

#### Using `Ember.RSVP.hash()` to retrieve multiple models in the same route

For downloading multiple models in the same route we have to use the `Ember.RSVP.hash()` function in the `model` hook.

`RSVP.hash` wraps multiple promises and returns a nicely structured hashed object. More information: <http://emberjs.com/api/classes/RSVP.html#method_hash>

*We can import `hash` directly from `rsvp` package.*

```js
// app/routes/admin/seeder.js
import { hash } from 'rsvp';
import Route from '@ember/routing/route';

export default Route.extend({

  model() {
    return hash({
      libraries: this.store.findAll('library'),
      books: this.store.findAll('book'),
      authors: this.store.findAll('author')
    })
  },

  setupController(controller, model) {
    controller.set('libraries', model.libraries);
    controller.set('books', model.books);
    controller.set('authors', model.authors);
    
    this._super(controller, model);
  }
});
```

`Ember.RSVP.hash` tries to download all three requested models, and only returns with a fulfilled state if all are retrieved successfully.

In the `setupController` hook, we split up the models into their own controller property. (As a good practice, we finally call the `this._super(controller, model)` also.)

(Of course there are alternative solutions. One of them is omitting the `setupController` and in this case we would use `model.libraries`, `model.books` properties in our controller and template directly. Other option, if you have a controller, you can make an alias there and assign `model.libraries` to `libraries`, so other developers can immediately see where those property data come from with checking the Controller file only. Ex.: `libraries: Ember.computed.alias('model.libraries')`.)

### Short summary of route hooks

You've already used a couple of hooks in routes, like `model` and `setupController`. Route hooks are called in specific sequence.

You can use the following snippet to experiment with them in one of your routes.

```js
import Route from '@ember/routing/route';

export default Route.extend({

  init() {
    debugger;
  },

  beforeModel(transition) {
    debugger;
  },

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

If you visit the route where you inserted the code above and open your web browser's inspector, the code will stop for debugging in each hook and you can see the order of the hooks. Here's a list of the hooks in the order they're called, and more information about each:

1. `init()` <http://emberjs.com/api/classes/Ember.Route.html#method_init>
2. `beforeModel(transition)` <http://emberjs.com/api/classes/Ember.Route.html#method_beforeModel>
3. `model(params, transition)` <http://emberjs.com/api/classes/Ember.Route.html#method_model>
4. `afterModel(model, transition)` <http://emberjs.com/api/classes/Ember.Route.html#method_afterModel>
5. `activate()` <http://emberjs.com/api/classes/Ember.Route.html#method_activate>
6. `setupController(controller, model)` <http://emberjs.com/api/classes/Ember.Route.html#method_setupController>
7. `renderTemplate(controller, model)` <http://emberjs.com/api/classes/Ember.Route.html#method_renderTemplate>

### Create a "number box" component to use on the admin/seeder page to display how much data we have in our database

We'll make a `number-box` component to visualize numbers on our page. Let's create our fancy component.

```shell
$ ember g component number-box
```

Setup `css` class names in the component controller.

```js
// app/components/number-box.js
import Component from '@ember/component';

export default Component.extend({

  classNames: ['panel', 'panel-warning']

});
```

And a little html in our component template:

```hbs
<!-- app/templates/components/number-box.hbs -->
{% raw %}<div class="panel-heading">
  <h3 class="text-center">{{title}}</h3>
  <h1 class="text-center">{{if number number '...'}}</h1>
</div>{% endraw %}
```

As you can see, we can pass our component two attributes: `title` and `number`.
If we are passed a value for `number`, we show that number, otherwise we show three dots.

Our component template is ready. We can use it in `app/templates/admin/seeder.hbs`.

```hbs
<!-- app/templates/admin/seeder.hbs -->
{% raw %}<h1>Seeder, our Data Center</h1>

<div class="row">
  <div class="col-md-4">{{number-box title="Libraries" number=libraries.length}}</div>
  <div class="col-md-4">{{number-box title="Authors" number=authors.length}}</div>
  <div class="col-md-4">{{number-box title="Books" number=books.length}}</div>
</div>{% endraw %}
```

If you open your browser now, you will see three boxes with numbers or three dots. Remember, we set up the `libraries`, `authors`, and `books` properties in our `setupController` hook. If our `model` hook downloaded our data from the server, those variables will not be empty. The `.length` method will return the size of that array. (As I mentioned above, you can skip remapping in `setupController` hook, in this case, you should use `model.libraries.length`, `model.authors.length`, etc. or as a third option you can add aliases in the controller.)

### Building forms to generate dummy data

We have to generate two other components that we're gonna use for the seeder page. Actually we'll only use one component in the `admin/seeder.hbs` template, but inside that component we will use another component. This part is a little bit advanced; I don't have a detailed explanation here, but you can copy paste the code and try out. I suggest playing around with the code to try to understand it, as well as checking out how it works in the [demo](https://library-app.firebaseapp.com/admin/seeder). However, don't forget, if you have any question, don't hesitate to ping me on Slack, on Twitter or in the comment section below.

Run these Ember CLI commands in your terminal.

```
$ ember g component seeder-block
$ ember g component fader-label
```

Insert the following codes in your component javascript files and templates.

```js
// app/components/seeder-block.js
import { lte, not, or } from '@ember/object/computed';
import Component from '@ember/component';

const MAX_VALUE = 100;

export default Component.extend({

  counter: null,

  isCounterValid: lte('counter', MAX_VALUE),
  isCounterNotValid: not('isCounterValid'),
  placeholder: `Max ${MAX_VALUE}`,

  generateReady: false,
  deleteReady: false,

  generateInProgress: false,
  deleteInProgress: false,

  generateIsDisabled: or('isCounterNotValid', 'generateInProgress', 'deleteInProgress'),
  deleteIsDisabled: or('generateInProgress', 'deleteInProgress'),

  actions: {

    generateAction() {
      if (this.get('isCounterValid')) {

        // Action up to Seeder Controller with the requested amount
        this.sendAction('generateAction', this.get('counter'));
      }
    },

    deleteAction() {
      this.sendAction('deleteAction');
    }

  }
});


```

```hbs
<!-- app/templates/components/seeder-block.hbs -->
{% raw %}<div class="well well-sm extra-padding-bottom">
  <h3>{{sectionTitle}}</h3>
  
  <div class="form-inline">
  
   <div class="form-group has-feedback {{unless isCounterValid 'has-error'}}">
     <label class="control-label">Number of new records:</label>
     {{input value=counter class='form-control' placeholder=placeholder}}
   </div>
  
   <button class="btn btn-primary" {{action 'generateAction'}} disabled={{generateIsDisabled}}>
     {{#if generateInProgress}}
       <span class="glyphicon glyphicon-refresh spinning"></span> Generating...
     {{else}}
       Generate {{sectionTitle}}
     {{/if}}
   </button>
   {{#fader-label isShowing=generateReady}}Created!{{/fader-label}}
  
   <button class="btn btn-danger" {{action 'deleteAction'}} disabled={{deleteIsDisabled}}>
     {{#if deleteInProgress}}
       <span class="glyphicon glyphicon-refresh spinning"></span> Deleting...
     {{else}}
       Delete All {{sectionTitle}}
     {{/if}}
   </button>
   {{#fader-label isShowing=deleteReady}}Deleted!{{/fader-label}}
  </div>
</div>{% endraw %}
```

```js
// app/components/fader-label.js
import { later, cancel } from '@ember/runloop';
import { observer } from '@ember/object';
import Component from '@ember/component';

export default Component.extend({
  tagName: 'span',

  classNames: ['label label-success label-fade'],
  classNameBindings: ['isShowing:label-show'],

  isShowing: false,

  isShowingChanged: observer('isShowing', function() {

    // User can navigate away from this page in less than 3 seconds, so this component will be destroyed,
    // however our "setTimeout" task try to run.
    // We save this task in a local variable, so we can clean up during the destroy process.
    // Otherwise you will see a "calling set on destroyed object" error.
    this._runLater = later(() => this.set('isShowing', false), 3000);
  }),

  resetRunLater() {
    this.set('isShowing', false);
    cancel(this._runLater);
  },

  willDestroy() {
    this.resetRunLater();
    this._super(...arguments);
  }
});
```

```hbs
<!-- app/templates/components/fader-label.hbs -->
{% raw %}{{yield}}{% endraw %}
```

We need also a little `scss` snippet.

```scss
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
  margin: 10px;
  opacity: 0;
  @include transition(all 0.5s);
  &.label-show {
    opacity: 1;
  }
}

.extra-padding-bottom {
  padding-bottom: 20px;
}

// Spinner in a button
.glyphicon.spinning {
  animation: spin 1s infinite linear;
  -webkit-animation: spin2 1s infinite linear;
}

@keyframes spin {
  from { transform: scale(1) rotate(0deg); }
  to { transform: scale(1) rotate(360deg); }
}

@-webkit-keyframes spin2 {
  from { -webkit-transform: rotate(0deg); }
  to { -webkit-transform: rotate(360deg); }
}
```

We have our components, let's insert them in `seeder.hbs`

```hbs
<!-- app/templates/admin/seeder.hbs -->
{% raw %}<h1>Seeder, our Data Center</h1>

<div class="row">
 <div class="col-md-4">{{number-box title="Libraries" number=libraries.length}}</div>
 <div class="col-md-4">{{number-box title="Authors" number=authors.length}}</div>
 <div class="col-md-4">{{number-box title="Books" number=books.length}}</div>
</div>

{{seeder-block
 sectionTitle='Libraries'
 generateAction='generateLibraries'
 deleteAction='deleteLibraries'
 generateReady=libDone
 deleteReady=libDelDone
 generateInProgress=generateLibrariesInProgress
 deleteInProgress=deleteLibrariesInProgress}}

{{seeder-block
 sectionTitle='Authors with Books'
 generateAction='generateBooksAndAuthors'
 deleteAction='deleteBooksAndAuthors'
 generateReady=authDone
 deleteReady=authDelDone
 generateInProgress=generateBooksInProgress
 deleteInProgress=deleteBooksInProgress}}{% endraw %}
```
### Install `faker.js` for dummy data

To generate dummy data we have to install `faker.js`. <https://github.com/johnotander/ember-faker>

```shell
$ ember install ember-faker
```

We import `faker` in our models, where we extend each of our models with a `randomize()` function for generating dummy data.

Update your models with the followings.

```js
// app/models/library.js
import { notEmpty } from '@ember/object/computed';
import DS from 'ember-data';
import Faker from 'faker';

export default DS.Model.extend({

  name: DS.attr('string'),
  address: DS.attr('string'),
  phone: DS.attr('string'),

  books: DS.hasMany('book', { inverse: 'library', async: true }),

  isValid: notEmpty('name'),

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

```js
// app/models/book.js
import DS from 'ember-data';
import Faker from 'faker';

export default DS.Model.extend({

  title: DS.attr('string'),
  releaseYear: DS.attr('date'),

  author: DS.belongsTo('author', { inverse: 'books', async: true }),
  library: DS.belongsTo('library', { inverse: 'books', async: true }),

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
    return new Date(this._getRandomArbitrary(1900, 2015).toPrecision(4));
  },

  _getRandomArbitrary(min, max) {
    return Math.random() * (max - min) + min;
  }
});

```

```js
// app/models/author.js
import { empty } from '@ember/object/computed';
import DS from 'ember-data';
import Faker from 'faker';

export default DS.Model.extend({

  name: DS.attr('string'),
  books: DS.hasMany('book', { inverse: 'author', async: true }),

  isNotValid: empty('name'),

  randomize() {
    this.set('name', Faker.name.findName());

    // With returning the author instance, the function can be chainable,
    // for example `this.store.createRecord('author').randomize().save()`,
    // check in Seeder Controller.
    return this;
  }
});
```

Add the following code in your `environment.js` file if you plan to deploy the app to firebase again. Without it your pages won't load.

```js
//config/environment.js
if (environment === 'production') {
  ENV['ember-faker'] = {
    enabled: true
  };
}
```

We will implement our actions in our controller.

```bash
$ ember generate controller admin/seeder
```

```js
// app/controllers/admin/seeder.js
import { all } from 'rsvp';
import Controller from '@ember/controller';
import Faker from "faker";

export default Controller.extend({

  actions: {

    generateLibraries(volume) {

      // Progress flag, data-down to seeder-block where our lovely button will show a spinner...
      this.set('generateLibrariesInProgress', true);

      const counter = parseInt(volume);
      let savedLibraries = [];

      for (let i = 0; i < counter; i++) {

        // Collect all Promise in an array
        savedLibraries.push(this._saveRandomLibrary());
      }

      // Wait for all Promise to fulfill so we can show our label and turn off the spinner.
      all(savedLibraries)
        .then(() => {
          this.set('generateLibrariesInProgress', false);
          this.set('libDone', true)
        });
    },

    deleteLibraries() {

      // Progress flag, data-down to seeder-block button spinner.
      this.set('deleteLibrariesInProgress', true);

      // Our local _destroyAll return a promise, we change the label when all records destroyed.
      this._destroyAll(this.get('libraries'))

        // Data down via seeder-block to fader-label that we ready to show the label.
        // Change the progress indicator also, so the spinner can be turned off.
        .then(() => {
          this.set('libDelDone', true);
          this.set('deleteLibrariesInProgress', false);
        });
    },

    generateBooksAndAuthors(volume) {

      // Progress flag, data-down to seeder-block button spinner.
      this.set('generateBooksInProgress', true);

      const counter = parseInt(volume);
      let booksWithAuthors = [];

      for (let i = 0; i < counter; i++) {

        // Collect Promises in an array.
        const books = this._saveRandomAuthor().then(newAuthor => this._generateSomeBooks(newAuthor));
        booksWithAuthors.push(books);
      }

      // Let's wait until all async save resolved, show a label and turn off the spinner.
      all(booksWithAuthors)

        // Data down via seeder-block to fader-label that we ready to show the label
        // Change the progress flag also, so the spinner can be turned off.
        .then(() => {
          this.set('authDone', true);
          this.set('generateBooksInProgress', false);
        });
    },

    deleteBooksAndAuthors() {

      // Progress flag, data-down to seeder-block button to show spinner.
      this.set('deleteBooksInProgress', true);

      const authors = this.get('authors');
      const books = this.get('books');

      // Remove authors first and books later, finally show the label.
      this._destroyAll(authors)
        .then(() => this._destroyAll(books))

        // Data down via seeder-block to fader-label that we ready to show the label
        // Delete is finished, we can turn off the spinner in seeder-block button.
        .then(() => {
          this.set('authDelDone', true);
          this.set('deleteBooksInProgress', false);
        });
    }
  },

  // Private methods

  // Create a new library record and uses the randomizator, which is in our model and generates some fake data in
  // the new record. After we save it, which is a promise, so this returns a promise.
  _saveRandomLibrary() {
    return this.store.createRecord('library').randomize().save();
  },

  _saveRandomAuthor() {
    return this.store.createRecord('author').randomize().save();
  },

  _generateSomeBooks(author) {
    const bookCounter = Faker.random.number(10);
    let books = [];

    for (let j = 0; j < bookCounter; j++) {
      const library = this._selectRandomLibrary();

      // Creating and saving book, saving the related records also are take while, they are all a Promise.
      const bookPromise =
        this.store.createRecord('book')
          .randomize(author, library)
          .save()
          .then(() => author.save())

          // guard library in case if we don't have any
          .then(() => library && library.save());
      books.push(bookPromise)
    }

    // Return a Promise, so we can manage the whole process on time
    return all(books);
  },

  _selectRandomLibrary() {

    // Please note libraries are records from store, which means this is a DS.RecordArray object, it is extended from
    // Ember.ArrayProxy. If you need an element from this list, you cannot just use libraries[3], we have to use
    // libraries.objectAt(3)
    const libraries = this.get('libraries');
    const size = libraries.get('length');

    // Get a random number between 0 and size-1
    const randomItem = Faker.random.number(size - 1);
    return libraries.objectAt(randomItem);
  },

  _destroyAll(records) {

    // destroyRecord() is a Promise and will be fulfilled when the backend database is confirmed the delete
    // lets collect these Promises in an array
    const recordsAreDestroying = records.map(item => item.destroyRecord());

    // Wrap all Promise in one common Promise, RSVP.all is our best friend in this process. ;)
    return all(recordsAreDestroying);
  }
});
```
## <a name='lesson-7'></a>Lesson 7

### CRUD interface for Authors and Books, managing model relationship

We are going to create two new pages: Authors and Books, where we list our data and manage them.
We implement create, edit and delete functionality, search and pagination also.
You can learn here, how could you manage relations between models. (Still work in progress, listing and editing author's data is implemented so far.)

Let's create our two new pages.

    $ ember g route authors
    $ ember g route books

These will add two new lines to our `router.js`.

    this.route('authors');
    this.route('books');

We have two new template files also: `authors.hbs` and `books.hbs`

You can find two new files in `app/routes` folder: `authors.js` and `books.js`

Let's extend our navigation bar. Just add the following two lines to your `navbar.hbs`. I just inserted next to the `Libraries` menu point. (You can move the `About` and `Contact` menu point next to the `Admin` also.)

```hbs {% raw %}
{{#nav-link-to 'authors'}}Authors{{/nav-link-to}}
{{#nav-link-to 'books'}}Books{{/nav-link-to}}{% endraw %}
```

We are going to focus here on Authors page, we build it up together, after as a practice you can build up the Books section yourself. ;)

#### Check the `Author` model

 First, check `app/models/author.js` file. If you've followed the Lesson 6 and added `Faker`, maybe you have some extra lines in your model, like `randomize()` method, however for us the most important is the Author model fields:

  ```js
  name: DS.attr('string'),
  books: DS.hasMany('book', { inverse: 'author' }),
  ```

 So we have a `name` field and a `books` field, which is related to the `Book` model. The `inverse` property is not really necessary, because we follow strictly the conventions, but I just leave there, so you can learn more about it in the official guide: <https://guides.emberjs.com/v{{ page.ember_version}}.0/models/relationships/#toc_explicit-inverses>

#### Download data from the server

We would like to list all authors, when the user visits Authors page, we have to download the data from the server. Let's implement the `model()` hook in Authors' route handler.

```js
// app/routes/authors.js
import Route from '@ember/routing/route';

export default Route.extend({

  model() {
    return this.store.findAll('author');
  }
});
```

Now we can update the `authors` template file to list all data.

```hbs {% raw %}
 <!-- app/templates/authors.hbs -->
 <h1>Authors</h1>

 <table class="table table-bordered table-striped">
   <thead>
     <tr>
       <th>Name</th>
       <th>Books</th>
     </tr>
   </thead>
   <tbody>
     {{#each model as |author|}}
       <tr>
         <td>{{author.name}}</td>
         <td>
           <ul>
             {{#each author.books as |book|}}
               <li>{{book.title}}</li>
             {{/each}}
           </ul>
         </td>
       </tr>
     {{/each}}
   </tbody>
 </table>{% endraw %}
```

It's a simple striped table with two columns. Because `model` array contains all the record about authors (we returned those in `model()` hook in the route handler and Ember automatically passes forward those records to controller and add to `model` property), so we can list them with an `each` block. Showing the `author.name` is simple.

The interesting part is using the `author.books`. Ember Data asynchronously downloads the related model if we use that information. We previously setup in our `model/author.js` file, that `books` field connect to `Book` model with a `hasMany` relationship. Ember Data fills that field with an array of records. We can use an `each` block to iterate them and list in our table. Check out in your app. (If you use `Faker` for generating book titles, you will see a few funny data there. :) )

#### Click on a name to edit Author's name

Let's improve further our template. At this stage we will add functionality to the main `authors.hbs` template, however when you feel that a template is getting too big, you can clean it up extracting functionality to components. We can do it later.

It would be cool if we would be able to edit an author's name with clicking on it. It means, that an `author` would have two states: it is in editing mode and it is not. We can store this state in the model itself. It doesn't have to be a "database" field, it is just a state in the memory. Let's call it `isEditing`. In our `each` loop we can check `author.isEditing` true or false. When it is `true` we can show a form, else only the name.

When we show only the name, we wrap it in a simple `<span>` with an `action` which manages the click event. We implement the `editAuthor` action in our route handler.

When we edit the name, we have to manage `saveAuthor` action and `cancelAuthorEdit`. Additionally submit should be disabled if the new data is not valid.

Update your `authors.hbs` template:

```hbs {% raw %}
<!-- app/templates/authors.hbs -->
<h1>Authors</h1>

<table class="table table-bordered table-striped">
  <thead>
  <tr>
    <th>
      Name
      <br><small class="small not-bold">(Click on name for editing)</small>
    </th>
    <th class="vtop">Books</th>
  </tr>
  </thead>
  <tbody>
  {{#each model as |author|}}
    <tr>
      <td>
        {{#if author.isEditing}}
          <form {{action 'saveAuthor' author on='submit'}} class="form-inline">
            <div class="input-group">
              {{input value=author.name class="form-control"}}
              <div class="input-group-btn">
                <button type="submit" class="btn btn-success" disabled={{author.isNotValid}}>Save</button>
                <button class="btn btn-danger" {{action 'cancelAuthorEdit' author}}>Cancel</button>
              </div>
            </div>
          </form>
        {{else}}
          <span {{action 'editAuthor' author}}>{{author.name}}</span>
        {{/if}}
      </td>
      <td>
        <ul>
          {{#each author.books as |book|}}
            <li>{{book.title}}</li>
          {{/each}}
        </ul>
      </td>
    </tr>
  {{/each}}
  </tbody>
</table> {% endraw %}
```

Implement `isNotValid` method in your model with adding an import and a computed property to `app/models/author.js`:

    import { empty } from '@ember/object/computed';
    ...

    isNotValid: empty('name'),

And add `actions` to `app/routes/authors.js`:

```js
// app/routes/authors.js
import Route from '@ember/routing/route';

export default Route.extend({

  model() {
    return this.store.findAll('author');
  },

  actions: {

    editAuthor(author) {
      author.set('isEditing', true);
    },

    cancelAuthorEdit(author) {
      author.set('isEditing', false);
      author.rollbackAttributes();
    },

    saveAuthor(author) {

      if (author.get('isNotValid')) {
        return;
      }

      author.set('isEditing', false);
      author.save();
    }
  }
});
```

Check out your app. Click on a name, edit it, save or cancel. Hope everything works as expected.

Any time when we invoke an action, it passes the selected `author` record to that function as a parameter, so we can set `isEditing` on that record only.

In case of cancellation we revoke changes with `rollbackAttributes`.

The `if` - `else` block in the template helps to manage `isEditing` state.

It is a good practice wrapping `input` fields and buttons with `form` tag, because we can submit data with typing Enter in the input field. However, it works properly only if we add `on='submit'` to the `action`.

There are two new classes in our stylesheet also, please extend `app/styles/app.scss`:

```css
.vtop {
  vertical-align: top!important;
}

.not-bold {
  font-weight: normal!important;
}
```

Now you can try to create a list about books on Books page, with a simple table where you list `book.title` and `book.author.name`. You can use the above logic to update a book title if you click on it. Good luck! :)

## Under the hood

If you would like to see more information in your browser's console about what Ember.js is doing under the hood, you can turn on a few debugging options in your configuration file.

You can find a list of debugging options in `./config/environment.js` file. Remove the comment signs for the code to read as follows:

```js {% raw %}
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
Check your app and open the Console in Chrome/Firefox. You will see some extra information about what Ember.js actually does under the hood. Don't worry if you don't understand these debug messages at this stage. As you spend more and more time with Ember.js development, these lines are going to be clearer. (If you prefer to keep your development console clear, just comment out these debugging options. You can turn on and off them, whenever you like.)

## TBC

Well done you folks who made it this far. Keep up the good work.

If you would like to know about new blog updates, please [follow me on twitter](http://twitter.com/zoltan_nz).

Check out my new tutorial in the following GitHub repository's README, work in progress: [Product App](https://github.com/zoltan-nz/product-app)

## Contributors

Thanks for your help to improve further the most popular [Ember tutorial](https://yoember.com): 

* [@jkeat](https://github.com/jkeat) 
* [@sigu](https://github.com/sigu)
* [@batisteo](https://github.com/batisteo)
* [@claudey](https://github.com/claudey)

## Other tutorials, examples

* ProductApp - a tutorial where we build an online store together with Ember.js, WIP: [https://github.com/zoltan-nz/product-app](https://github.com/zoltan-nz/product-app)
* MapTouch - playing with d3.js, animation and canvases: [https://github.com/zoltan-nz/map-touch](https://github.com/zoltan-nz/map-touch)  
* Contacts App Client with Firebase Authentication (Ember.js): [https://github.com/zoltan-nz/contacts-app-client](https://github.com/zoltan-nz/contacts-app-client)
* Chat App (Ember.js): [https://github.com/zoltan-nz/chat-app-v2](https://github.com/zoltan-nz/chat-app-v2)
* Bookstore API (Ruby on Rails): [https://github.com/zoltan-nz/bookstore-api](https://github.com/zoltan-nz/bookstore-api)
* Bookstore Client (Ember.js): [https://github.com/zoltan-nz/bookstore-client](https://github.com/zoltan-nz/bookstore-client)

<hr>
