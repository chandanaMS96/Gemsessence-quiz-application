class AddNoOfQuestionsToQuiz < ActiveRecord::Migration[6.1]
  def change
  	add_column :quizzes, :no_of_questions, :integer, :default => 10
  end
end
