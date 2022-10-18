class CreatePlumbers < ActiveRecord::Migration[6.1]
  def change
    create_table :plumbers do |t|
      t.string              :name,          null: false
      t.string              :vehicle
      t.references   :address,       foreign_key: true
      t.timestamps
    end

    add_index :plumbers,  :name,  unique: true
  end
end
