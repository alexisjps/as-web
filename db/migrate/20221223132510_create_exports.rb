class CreateExports < ActiveRecord::Migration[7.0]
  def change
    create_table :exports do |t|

      t.timestamps
    end
  end
end
