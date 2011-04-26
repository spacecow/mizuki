class PicturesController < ApplicationController
  load_and_authorize_resource :gallery
  load_and_authorize_resource :picture, :through => :gallery

  def show
  end
  
  def new
  end

  def create
    if @picture.save
      redirect_to @gallery, :notice => added(:picture)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @picture.update_attributes(params[:picture])
      redirect_to [@gallery,@picture]
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    redirect_to @gallery
  end
end
