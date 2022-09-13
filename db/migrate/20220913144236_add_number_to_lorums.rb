class AddNumberToLorums < ActiveRecord::Migration[7.0]
  def change
    add_column :lorums, :number, :integer
  end
end
