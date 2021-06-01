class CreateUserContests < ActiveRecord::Migration[6.1]
  def change
    create_table :user_contests do |t|
      t.integer :answer_id, null: false
      t.integer :question_id, null: false
      t.integer :quiz_id, null: false
      t.boolean :is_correct, null: false
      t.timestamps
    end
  end
end
