class QuestionsController < ApplicationController
  include QuestionsHelper

  before_action  :current_user,:logged_in? ,except: [:new]
  def index
    @questions = Question.order(created_at: :desc)
  end

  def create
    params[:timer] = get_timestamp_timer(params[:timer])
    question = Question.new(require_questions_params)
    if question.valid?
      question.save
      redirect_to questions_path
    else
      redirect_to new_question_path
    end
  end

  def new
    @quizzes = Quiz.order(created_at: :desc)
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
