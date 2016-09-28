class TicketSearchesController < ApplicationController
  def show
<<<<<<< HEAD
    if params[:departure_station] && params[:destination_station]
      @departure_station = RailwayStation.find(params[:departure_station][:id]) 
      @destination_station = RailwayStation.find(params[:destination_station][:id])
      @trains = TicketSearch.find_trains(@departure_station, @destination_station)
=======
    if params[:first_station] && params[:last_station]
      @first_station = RailwayStation.find(params[:first_station][:id]) 
      @last_station = RailwayStation.find(params[:last_station][:id])
      @trains = TicketSearch.find_trains(@first_station, @last_station)
>>>>>>> ad1c43e25fdd5675e88345172376701de2513499
    else
    end
  end
end
