class CabsController < ApplicationController
  
  def index
    @cabs = Cab.all
    current_user
  end

  def show
    @cab = Cab.find(params[:id])
  end
  def new
    @cab = Cab.new
  end
  def create
    @cab = Cab.new(cab_params)

    if @cab.save
      redirect_to @cab
    else
      render :new, status: :unprocessable_entity
    end
  end
  def destroy
    @cab = Cab.find(params[:id])
    @cab.destroy

    redirect_to '/cabs', status: :see_other
  end
  private
  def cab_params
    params.require(:cab).permit(:registration, :category,:driver_name,:rate)
  end
 
end
