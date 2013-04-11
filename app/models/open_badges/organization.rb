module OpenBadges
  class Organization < ActiveRecord::Base
    attr_accessible :description, :email, :image, :name, :url

    validates :url, :name, presence: true

    has_attached_file :image, :url => "/:class/:attachment/:id_:filename",
      :default_url => "/open_badges/missing.png"

    public
    def image_url
      Rails.application.config.default_url_options[:host] + image.url
    end

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
