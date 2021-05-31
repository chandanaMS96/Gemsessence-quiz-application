class QuestionsController < ApplicationController

  include QuestionsHelper

  def index
    @questions = Question.order(created_at: :desc)
  end

  def create
    question = Question.new(require_questions_params)
    if question.valid?
      question.save
      redirect_to questions_path
    else
      redirect_to new_question_path
    end
  end

  def update
    question = Question.find_by(id: params[:id])
    if question.present?
      if question.update(require_questions_params)
        redirect_to questions_path
      else
        redirect_to new_question_path
      end
    else
       redirect_to new_question_path
    end
  end

  def show
    @question = Question.find_by(id: params[:id])
 
  end

  def destroy
    question = Question.find_by(id: params[:id])
    question.destroy
    redirect_to new_question_path    
  end

  private

  def require_questions_params
    params.permit(:body, :correct_answer_id, :quiz_id, :timer)
  end
end
