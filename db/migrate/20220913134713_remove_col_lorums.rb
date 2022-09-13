class RemoveColLorums < ActiveRecord::Migration[7.0]
  def change
    remove_column :lorums, :number
  end
end
