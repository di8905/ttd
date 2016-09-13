class WagonsController < ApplicationController
before_action :set_wagon, only: [:show]

  def index
    @wagons = Wagon.all
  end

  def new
    @wagon = Wagon.new
  end

  def create
    @wagon = Wagon.new(wagon_params)
    redirect_to wagons_url
  end

  def show
  end



private

  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def wagon_params
    params.require(:wagon).permit(:w_type, :upper_seats, :lower_seats)
  end

end
