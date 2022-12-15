class AddColToUserConditions < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :conditions, :string
  end
end
