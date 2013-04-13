require 'cancan'
require 'jquery-rails'
require 'select2-rails'
require 'will_paginate'
require 'bootstrap-sass'
require 'paperclip'
require 'chunky_png'
require 'open_badges/attachment_helper.rb'

module OpenBadges
  class Engine < ::Rails::Engine
    isolate_namespace OpenBadges
  end
end
