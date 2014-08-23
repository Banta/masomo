class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.integer :course_id, null: false
      t.integer :lecturer_id, null: false

      t.timestamps
    end
  end
end
