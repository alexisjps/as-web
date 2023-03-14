class RenameColClients < ActiveRecord::Migration[7.0]
  def change
    rename_column :clients, :last_name, :denomination
  end
end
