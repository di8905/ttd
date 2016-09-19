class RenameStationOrderColumnToPosition < ActiveRecord::Migration[5.0]
  def change
    rename_column :railway_stations_routes, :station_order, :position
  end
end
