class AddCredentialsToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :credentials, :string
  end
end
