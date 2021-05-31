class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.string :status
      t.integer :no_of_questions
      t.timestamps
    end
  end
end
