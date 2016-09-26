class RailwayStation < ActiveRecord::Base
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :tickets_to_here, class_name: 'Ticket', foreign_key: :destination_station_id
  has_many :tickets_from_here, class_name: 'Ticket', foreign_key: :departure_station_id

  validates :title, presence: true

  scope :ordered, -> { order('railway_stations_routes.position') }

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  def show_position(route)
    station_route(route).try(:position)
  end
  
  protected
  
  def station_route(route)
    @station_route ||= railway_stations_routes.where(route_id: route).first
  end  
end
