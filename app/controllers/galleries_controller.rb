class GalleriesController < ApplicationController
  load_and_authorize_resource

  def show
    @pictures = @gallery.pictures
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

  def edit
  end

  def destroy
    @gallery.destroy
    redirect_to galleries_path
  end
end
