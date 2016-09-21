class RemoveWTypeFromCarriages < ActiveRecord::Migration[5.0]
  def change
    remove_column :carriages, :w_type
  end
end
