class Route < ActiveRecord::Base
  validates :name, presence: true
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_route_id
end
