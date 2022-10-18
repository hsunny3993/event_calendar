class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.date            :start_date,  null: false
      t.date            :end_date,    null: false
      t.references :client,     foreign_key: true
      t.timestamps
    end
  end
end
