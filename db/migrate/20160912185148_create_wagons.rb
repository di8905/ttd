class CreateWagons < ActiveRecord::Migration[5.0]
  def change
    create_table :wagons do |t|
      t.string :w_type
      t.integer :upper_seats
      t.integer :lower_seats

      t.timestamps
    end
  end
end
