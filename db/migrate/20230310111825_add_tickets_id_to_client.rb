class AddTicketsIdToClient < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :ticket, foreign_key: true
  end
end
