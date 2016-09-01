class RailwayStation < ActiveRecord::Base
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :tickets, foreign_key: :departure_station_id
  has_many :tickets, foreign_key: :destination_station_id
end
