class CreatePlumbers < ActiveRecord::Migration[6.1]
  def change
    create_table :plumbers do |t|

      t.timestamps
    end
  end
end
