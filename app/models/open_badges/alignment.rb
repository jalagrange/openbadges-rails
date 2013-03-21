module OpenBadges
  class Alignment < ActiveRecord::Base
    has_many :badge_alignments, dependent: :destroy
    has_many :badge, through: :badge_alignment

    attr_accessible :description, :name, :url
    
    validates :name, uniqueness: true
    validates :name, :url, presence: true

    public
    def as_json(options = nil)
      json = super(:only => [:url, :name])
      json[:description] = self.description unless self.description.empty?
      json
    end
  end
end
