class RenameAndAddCarriageColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :carriages, :upper_seats, :top_seats
    rename_column :carriages, :lower_seats, :bottom_seats
    add_column :carriages, :side_top_seats, :integer
    add_column :carriages, :side_bottom_seats, :integer
    add_column :carriages, :seats, :integer
  end
end
