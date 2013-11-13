class Story < ActiveRecord::Base
  attr_accessible :content, :location, :latitude, :longitude
  belongs_to :user

  geocoded_by :location
  after_validation :geocode
end
