class AddForeignKeyToCloud < ActiveRecord::Migration[7.0]
  def change
    add_reference :clouds, :user, foreign_key: true
  end
end
