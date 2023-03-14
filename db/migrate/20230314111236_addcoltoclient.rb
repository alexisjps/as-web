class Addcoltoclient < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :last_name, :string
  end
end
