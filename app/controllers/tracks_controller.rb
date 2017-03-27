class TracksController < ApplicationController
  def index
    @tracks = Track.all
    if current_user
      render 'index.html.erb'
    else
      flash[:error] = "You must be logged in to view that page"
      redirect_to '/'
    end
  end

  def new
  end

  def create
    @track = Track.new(name: params[:name])

    if @track.save
      flash[:success] = "Track has been added"
      redirect_to '/tracks'
    else
      flash[:warning] = "Something went wrong"
      redirect_to '/tracks/new'
    end

  end
end
