class AddPassportNumberToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :passport_number, :integer
  end
end
