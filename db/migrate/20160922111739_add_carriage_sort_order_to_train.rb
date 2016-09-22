class AddCarriageSortOrderToTrain < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :carriage_sort_order, :boolean
  end
end
