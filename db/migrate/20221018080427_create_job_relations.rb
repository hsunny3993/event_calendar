class CreateJobRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :job_relations do |t|
      t.references :job,      foreign_key: true
      t.references :plumber,  foreign_key: true
      t.timestamps
    end
  end
end
