class RemoveDescriptionFromRoute < ActiveRecord::Migration[5.0]
  def change
    remove_column :routes, :description, :string
  end
end
