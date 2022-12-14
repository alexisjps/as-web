class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.integer :amount, default: 0
      t.string :my_company_name
      t.string :my_compagny_address
      t.integer :my_company_phone
      t.string :my_company_email
      t.integer :my_company_siret
      t.string :my_company_tva
      t.text :my_company_paiement
      t.string :customer_name
      t.string :customer_address
      t.string :customer_email
      t.integer :customer_siret
      t.date :date
      t.string :description
      t.integer :invoice_number
      t.text :prestation
      t.integer :invoice_tva

      t.timestamps
    end
  end
end
