class MaintenancesController < ApplicationController
  load_and_authorize_resource

  def index
    @maintenances = Maintenance.all
  end

  def edit
  end

  def update
    if @maintenance.update_attributes(params[:maintenance])
      redirect_to maintenances_path, :notice => updated(:maintenance)
    else
      render :edit
    end
  end

  def destroy
    @maintenance.destroy
    redirect_to maintenances_path
  end
end
