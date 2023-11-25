class ChangeAmountInFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :invoices, :amount, :float
  end
end
