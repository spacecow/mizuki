class GalleriesController < ApplicationController
  load_and_authorize_resource

  def show
  end
  
  def index
    @galleries = Gallery.all
  end

  def new
  end

  def create
    if @gallery.save
      redirect_to galleries_path, :notice => created(:gallery)
    else
      render :new
    end
  end
end
