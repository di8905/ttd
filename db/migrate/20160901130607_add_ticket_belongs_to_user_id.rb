class AddTicketBelongsToUserId < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :tickets, :user
  end
end
