class AddColUsersTva < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :tva, :string
  end
end
