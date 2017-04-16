# yoember.com

[Ember.js tutorial](http://yoember.com)

### Launching server and guard

```
$ jekyll clean && jekyll serve -w
$ guard
```
OR

```
foreman start
```

### Deploy

```
jekyll clean && JEKYLL_ENV=production jekyll build
octopress deploy
```