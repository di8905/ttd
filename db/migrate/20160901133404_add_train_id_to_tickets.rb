class AddTrainIdToTickets < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :tickets, :train
  end
end
