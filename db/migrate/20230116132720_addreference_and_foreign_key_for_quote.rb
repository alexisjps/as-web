class AddreferenceAndForeignKeyForQuote < ActiveRecord::Migration[7.0]
  def change
    add_reference :quotes, :user, foreign_key: true
    add_reference :quotes, :client, foreign_key: true
  end
end
