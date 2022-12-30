class AddColToInvoiceStatus < ActiveRecord::Migration[7.0]
  def change
    add_column :invoices, :status, :boolean, default: false
  end
end
