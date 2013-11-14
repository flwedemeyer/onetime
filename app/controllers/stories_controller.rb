class StoriesController < ApplicationController
	# before_filter :autheticate_user!, except: [:index, :show]
  def index
    @stories = Story.all

    respond_to do |format|
      format.html
      format.json {render :json => @stories.to_json}
    end
  end
  
  def show
    @story = Story.find(params[:id])

    respond_to do |format|
      format.html {render :layout => !request.xhr?}
      format.json {render :json => @story.to_json}
    end  
  end
  
  def new
  	@story = Story.new
  end
  
  def create
  	@story = Story.new(params[:story])
    if @story.save
      @story.user = current_user
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
