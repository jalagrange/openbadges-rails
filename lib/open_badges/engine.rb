require 'devise'
require 'jquery-rails'
require 'select2-rails'
require 'will_paginate'
require 'bootstrap-sass'
require 'paperclip'

module OpenBadges
  class Engine < ::Rails::Engine
    isolate_namespace OpenBadges
  end
end
