class AddIndexesToTables < ActiveRecord::Migration[5.0]
  def change
    add_index :carriages, [:id, :type], 
  end
end
