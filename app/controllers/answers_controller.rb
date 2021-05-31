class AnswersController < ApplicationController
  include AnswersHelper

  def index
    @answers = Answer.order(created_at: :desc)
  end

  def create
    answer = Answer.new(require_answers_params)
    if answer.valid?
      answer.save
      redirect_to answers_path
    else
      redirect_to new_answer_path
    end
  end

  def update
    answer = Answer.find_by(id: params[:id])
    if answer.present?
      if answer.update(require_answers_params)
        redirect_to answers_path
      else
        redirect_to new_answer_path
      end
    else
       redirect_to new_answer_path
    end
  end

  def show
    @answer = Answer.find_by(id: params[:id])
 
  end

  def destroy
    answer = Answer.find_by(id: params[:id])
    answer.destroy
    redirect_to new_answer_path    
  end

  private

  def require_answers_params
    params.permit(:body, :answer_id, :is_correct)
  end
end
