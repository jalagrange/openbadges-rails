# OpenBadges-Rails

Ruby on Rails Open Badges Issuer

## Usage
Add to Gemfile
    gem 'open_badges', '0.0.1', :path => '/path/to/openbadges-rails'
    #gem 'open_badges', '0.0.1', :git => 'git://github.com/eldwin/openbadges-rails'
    bundle install

Install
    rails g open_badges:install

Set user class in "config/initializers/open_badges.rb"
    config.user_class = User

Set default url options for each environment in "config/environments/"
    config.default_url_options = { :host => 'localhost:3000' }


## Create db tables
    openbadges-rails> rake db:migrate


## Load seed data into db
    openbadges-rails> rake db:seed


## Add an administrator for Open Badges admin interface
    openbadges-rails> rake app:add_admin[<email>,<password>] // Without spaces


## Running tests
    openbadges-rails> rake test              // Run all tests
    openbadges-rails> rake app:test:units    // Run unit tests only
