class UsersController < ApplicationController
	def new
		@user = User.new
		@hash = Gmaps4rails.build_markers(@users) do |user, marker|
		  location[0] = marker.lat user.latitude
		  location[1] = marker.lng user.longitude
		 end 
	end

	def create
		@user = User.new(params[:user])
	    if @user.save
	      flash[:notice] = "Thank you for signing up! You are now logged in."
	      redirect_to root_url
	    else
	      render :action => 'new'
	    end
	end	
end
