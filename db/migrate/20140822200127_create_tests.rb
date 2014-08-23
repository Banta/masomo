class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :name
      t.integer :unit_id
      t.integer :duration

      t.datetime :start_time 
      t.datetime :due_date

      t.timestamps
    end
  end
end
