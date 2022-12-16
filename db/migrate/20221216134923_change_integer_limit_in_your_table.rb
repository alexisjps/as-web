class ChangeIntegerLimitInYourTable < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :siret, :string
    change_column :invoices, :customer_siret, :string
  end
end
