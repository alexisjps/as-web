class AddColToUserPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :infos_payment, :string
  end
end
