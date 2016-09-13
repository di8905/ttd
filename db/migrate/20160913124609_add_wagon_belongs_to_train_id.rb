class AddWagonBelongsToTrainId < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :wagons, :train
  end
end
