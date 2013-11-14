class Story < ActiveRecord::Base
  attr_accessible :content, :location, :latitude, :longitude
  belongs_to :user

  geocoded_by :location
  before_create :geocode
end
