class AddDiscountToInvoice < ActiveRecord::Migration[7.0]
  def change
    add_column :invoices, :discount, :integer
  end
end
