class WagonsController < ApplicationController

  def index
    @wagons = Wagon.all
  end

  def new
    @wagon = Wagon.new
  end

end
