class Train < ActiveRecord::Base
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :current_route, class_name: 'Route', foreign_key: :current_route_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :tickets
end
