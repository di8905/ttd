class RailwayStation < ActiveRecord::Base
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :tickets_to_here, class_name: 'Ticket', foreign_key: :destination_station_id
  has_many :tickets_from_here, class_name: 'Ticket', foreign_key: :departure_station_id

  validates :title, presence: true
end
