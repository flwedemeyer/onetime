class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :make_story_time

  def make_story_time
  	@new_story = Story.new
  end
end
