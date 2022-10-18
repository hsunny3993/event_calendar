class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :city, null: false
      t.string :state
      t.string :country, null: false
      t.string :postal_code, null: false
      t.timestamps
    end
  end
end
