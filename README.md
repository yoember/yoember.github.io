# yoember.com

[Ember.js tutorial](https://yoember.com)

## Usage instruction

- Clone the project

```
git clone git@github.com:yoember/yoember.github.io.git ~/projects/yoember --recurse-submodules
```
- Run submodule update. Bootstrap 4 is added as submodule to `_sass` folder.
```
git submodule update --recursive --remote
```
- Install Ruby gems with `bundler`
```
bundle install
```

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
