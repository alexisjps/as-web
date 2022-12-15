class RemoveColToInvoices < ActiveRecord::Migration[7.0]
  def change
    remove_column :invoices, :my_company_siret
    remove_column :invoices, :my_company_phone
    remove_column :invoices, :my_compagny_address
    remove_column :invoices, :my_company_paiement
  end
end
