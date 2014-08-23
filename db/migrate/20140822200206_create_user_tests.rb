class CreateUserTests < ActiveRecord::Migration
  def change
    create_table :user_tests do |t|
      t.integer :test_id
      t.integer :user_id
      t.integer :question_id
      t.string :answer

      t.string :status

      t.timestamps
    end
  end
end
