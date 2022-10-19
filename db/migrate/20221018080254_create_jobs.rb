class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string              :name,            null: false
      t.datetime            :start_time,      null: false
      t.datetime            :end_time,        null: false
      t.boolean             :is_completed,    null: false, default: false
      t.references     :client,         foreign_key: true
      t.timestamps
    end
  end
end
