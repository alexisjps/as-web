class DeleteRefUsers < ActiveRecord::Migration[7.0]
  def change
    remove_reference :users, :ticket, foreign_key: true
  end
end
