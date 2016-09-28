class TicketSearchesController < ApplicationController
  def show
    if params[:departure_station] && params[:destination_station]
      @departure_station = RailwayStation.find(params[:departure_station][:id]) 
      @destination_station = RailwayStation.find(params[:destination_station][:id])
      @trains = TicketSearch.find_trains(@departure_station, @destination_station)
    else
    end
  end
end
