class TracksController < ApplicationController
  def index
    if current_user
      render 'index.html.erb'
    else
      flash[:error] = "You must be logged in to view that page"
      redirect_to '/'
    end
  end

  def new
  end

  
end
