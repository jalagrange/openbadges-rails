module OpenBadges
  class Organization < ActiveRecord::Base
    include AttachmentHelper

    attr_accessible :description, :email, :image, :name, :url

    validates :url, :name, presence: true

    has_attached_file :image, :url => ATTACHMENT_URL,
      :default_url => MISSING_IMAGE_URL

    public
    def as_json(options = nil)
      json = super(
        :only => [:url, :name, :email, :description]
      ).reject{ |key, value| value.nil? || value.empty? }
      json.merge!({
        :image => (self.image_url unless !self.image?)
      })
    end
  end
end
