class WagonsController < ApplicationController

  def index
    @wagons = Wagon.all
  end

end
