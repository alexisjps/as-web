class CreateLorums < ActiveRecord::Migration[7.0]
  def change
    create_table :lorums do |t|
      t.text :paragraphe
      t.integer :number

      t.timestamps
    end
  end
end
