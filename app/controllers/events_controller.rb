class EventsController < ApplicationController
  load_and_authorize_resource

  def index
    @events = Event.all.sort_by(&:start).reverse
  end

  def show
    @event = Event.find(params[:id])
    #@pictures = @event.gallery ? @event.gallery.pictures.limit(4) : []
    if @event.gallery
      size = @event.gallery.pictures.count
      r = size > 4 ? rand(size-4) : 0
      @pictures = @event.gallery.pictures.all(:offset => r,:limit => 4)
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to @event, :notice => created(:event)
    else
      render :action => 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to @event, :notice  => updated(:event)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_url, :notice => deleted(:event)
  end
end
