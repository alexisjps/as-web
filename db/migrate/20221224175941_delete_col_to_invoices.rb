class DeleteColToInvoices < ActiveRecord::Migration[7.0]
  def change
    remove_column :invoices, :customer_address
    remove_column :invoices, :customer_email
    remove_column :invoices, :customer_siret
    remove_column :invoices, :invoice_tva
    remove_column :invoices, :customer_name
    remove_column :invoices, :my_company_name
    remove_column :invoices, :my_company_email
    remove_column :invoices, :my_company_tva
  end
end
