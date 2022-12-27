class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :compagny_siret
      t.string :compagny_address
      t.string :phone

      t.timestamps
    end
  end
end
