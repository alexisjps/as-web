class DefaultValueDiscount < ActiveRecord::Migration[7.0]
  def change
    change_column :invoices, :discount, :integer, default: 0
  end
end
