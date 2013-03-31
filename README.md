# OpenBadges-Rails

Ruby on Rails Open Badges Issuer

## Usage
Add to Gemfile
```sh
gem 'open_badges', '0.0.1', :path => '/path/to/openbadges-rails'
#gem 'open_badges', '0.0.1', :git => 'git://github.com/eldwin/openbadges-rails'
bundle install
```

Install
```sh
rails g open_badges:install
```

Set user class in "config/initializers/open_badges.rb"
```sh
config.user_class = User
```

Set default url options for each environment in "config/environments/"
```sh
config.default_url_options = { :host => 'localhost:3000' }
```

## Create db tables
    openbadges-rails> rake db:migrate


## Load seed data into db
    openbadges-rails> rake db:seed


## Running tests
    openbadges-rails> rake test              // Run all tests
    openbadges-rails> rake app:test:units    // Run unit tests only

## Uploaded Images

Uploaded images are stored in

    /public/:class/:attachment/:id_:filename

    Example: test/dummy/public/open_badges/badges/image/1_teleport.png

For uploading unit test, images are stored in

    openbadges-rails/tmp/test/:class/:attachment/:id_:filename

    Example: openbadges-rails/tmp/test/open_badges/badges/images/1_Smiley_face.jpg
