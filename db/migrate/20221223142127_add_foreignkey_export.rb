class AddForeignkeyExport < ActiveRecord::Migration[7.0]
  def change
    add_reference :exports, :invoice, foreign_key: true
  end
end
