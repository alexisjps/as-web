class RenamequoteTva < ActiveRecord::Migration[7.0]
  def change
    rename_column :quotes, :invoice_tva, :quote_tva
  end
end
