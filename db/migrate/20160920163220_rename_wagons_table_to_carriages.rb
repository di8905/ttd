class RenameWagonsTableToCarriages < ActiveRecord::Migration[5.0]
  def change
    rename_table :wagons, :carriages
  end
end
