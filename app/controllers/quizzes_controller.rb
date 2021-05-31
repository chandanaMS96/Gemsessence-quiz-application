class QuizzesController < ApplicationController
  include QuizzesHelper

  def index
    @quizzes = Quiz.order(created_at: :desc)
  end

  def create
    quiz = Quiz.new(require_quizzes_params)
    if quiz.valid?
      quiz.save
      redirect_to quizzes_path
    else
      redirect_to new_quiz_path
    end
  end

  def update
    quiz = Quiz.find_by(id: params[:id])
    if quiz.present?
      if quiz.update(require_quizzes_params)
        redirect_to quizzes_path
      else
        redirect_to new_quiz_path
      end
    else
       redirect_to new_quiz_path
    end
  end

  def show
    @quiz = Quiz.find_by(id: params[:id])
 
  end

  def destroy
    quiz = Quiz.find_by(id: params[:id])
    quiz.destroy
    redirect_to new_quiz_path    
  end

  private

  def require_quizzes_params
    params.permit(:title, :status, :no_of_questions)
  end
end




