class TicketSearchesController < ApplicationController
  def show
    if params[:first_station] && params[:last_station]
      @first_station = RailwayStation.find(params[:first_station][:id]) 
      @last_station = RailwayStation.find(params[:last_station][:id])
      @trains = TicketSearch.find_trains(@first_station, @last_station)
    else
    end
  end
end
