class InvoiceNumbertoString < ActiveRecord::Migration[7.0]
  def change
    change_column :invoices, :invoice_number, :string
  end
end
