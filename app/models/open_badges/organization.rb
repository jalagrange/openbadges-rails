module OpenBadges
  class Organization < ActiveRecord::Base
    attr_accessible :description, :email, :image, :name, :url

    validates :url, :name, presence: true

    public
    def as_json(options = nil)
      super(
        :only => [:url, :name, :image, :email, :description]
      ).reject{ |key, value| value.empty? }
    end
  end
end
