class Story < ActiveRecord::Base
  attr_accessible :content, :location
  belongs_to :user
end
