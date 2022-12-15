class AddColToCoordinate < ActiveRecord::Migration[7.0]
  def change
    add_column :coordinates, :address, :string
  end
end
