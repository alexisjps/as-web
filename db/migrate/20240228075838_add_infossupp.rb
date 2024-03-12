class AddInfossupp < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :info_supp, :string
    add_column :clients, :info_supp, :string
  end
end
