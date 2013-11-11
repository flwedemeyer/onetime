class StoriesController < ApplicationController
	# before_filter :autheticate_user!, except: [:index, :show]
  def index
    @stories = Story.find(:all)
  end
  
  def show
    
  end
  
  def new
  	@story = Story.new
  end
  
  def create

  	@story = Story.create(params[:story])
    @story.user = current_user
    
    if @story.save
      flash[:notice] = "Successfully created story."
      redirect_to '/'
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @story.update_attributes(params[:story])
      flash[:notice] = "Successfully updated story."
      redirect_to @story
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @story.destroy
    flash[:notice] = "Successfully destroyed story."
    redirect_to stories_url
  end
end
