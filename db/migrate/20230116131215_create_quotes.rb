class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.integer :amount
      t.date :date
      t.string :description
      t.string :quote_number
      t.text :prestation
      t.string :invoice_tva
      t.boolean :status

      t.timestamps
    end
  end
end
