require "open_badges/engine"

module OpenBadges
  class << self

	mattr_accessor :user_class
  	@@user_class = nil

	# setup user config
	def setup
	  yield self
	end

  	# Issue badge
  	public
  	def issue(options = nil)
  	  #image = ChunkyPNG::Image.from_blob(open(badge.image).read) # maybe can use from url
      #image = ChunkyPNG::Image.from_file(assertion.badge.image) # probably local files only
      #image.metadata['openbadges'] = assertions_url
      #image.to_blob # no save
      #image.save('file.png')

	  #user_class.find(options[:id])
  	end

  end
end
