# OpenBadges-Rails

Ruby on Rails Open Badges Issuer

## Usage
Add to Gemfile
```sh
gem 'open_badges', '0.0.1', :path => '/path/to/openbadges-rails'
#gem 'open_badges', '0.0.1', :git => 'git://github.com/eldwin/openbadges-rails'
bundle install
```

Install to run database migrations and mount engine
```sh
rails g open_badges:install
```

Set engine configurations at "config/initializers/open_badges.rb"
```sh
config.user_class = User

config.current_user = 'current_user'

config.is_openbadges_admin = 'is_openbadges_admin?'
```

Set default url options for each environment in "config/environments/"
```sh
config.default_url_options = { :host => 'localhost:3000' }
```

Integrate JavaScript Issuer API
https://github.com/mozilla/openbadges/wiki/Issuer-API
```sh
<%= javascript_include_tag "http://beta.openbadges.org/issuer.js" %>
```

## Development

Run migrations
```sh
cd test/dummy
dummy> rake openbadges:install:migrations
dummy> rake db:migrate
```

Seed db with data
```sh
dummy> rake db:seed
```


### Running tests
    openbadges-rails> rake test              // Run all tests
    openbadges-rails> rake app:test:units    // Run unit tests only

### Uploaded Images

Uploaded images are stored in

    /public/:class/:attachment/:id_:filename

    Example: test/dummy/public/open_badges/badges/image/1_teleport.png

For uploading unit test, images are stored in

    openbadges-rails/tmp/test/:class/:attachment/:id_:filename

    Example: openbadges-rails/tmp/test/open_badges/badges/images/1_Smiley_face.jpg
