class AddCurrentRouteIdToTrains < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :trains, :current_route
  end
end
