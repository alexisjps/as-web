class AddForeignKeyToClients < ActiveRecord::Migration[7.0]
  def change
    add_reference :clients, :user, foreign_key: true
    add_reference :invoices, :client, foreign_key: true
    add_column :invoices, :invoice_tva, :string
  end
end
