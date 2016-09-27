class TicketSearch < ApplicationRecord
  def self.find_trains(first_station, last_station)
    routes = routes_find(first_station) & routes_find(last_station)
    Train.where(route: routes)
  end
  
  private
  
  def self.routes_find(station)
    Route.joins(:railway_stations).where("railway_stations.id = ?", station)
  end
end
