class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :body, null: false
      t.integer :correct_answer_id
      t.integer :quiz_id
      t.timestamp :timer
      t.timestamps
    end
  end
end
