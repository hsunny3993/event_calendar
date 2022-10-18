class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string            :name,           null: false
      t.integer           :age,            null: false
      t.string            :private_note,   null: false
      t.references :address,       foreign_key: true
      t.timestamps
    end

    add_index :clients,  :name,  unique: true
  end
end
