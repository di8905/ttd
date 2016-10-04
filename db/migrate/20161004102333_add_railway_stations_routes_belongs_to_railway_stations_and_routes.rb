class AddRailwayStationsRoutesBelongsToRailwayStationsAndRoutes < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :railway_stations_routes, :route
    add_belongs_to :railway_stations_routes, :railway_station
  end
end
