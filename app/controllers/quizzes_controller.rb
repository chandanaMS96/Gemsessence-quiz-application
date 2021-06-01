class QuizzesController < ApplicationController
  include QuizzesHelper
  include ApplicationHelper

  before_action :current_user, :logged_in?, only: [:index]
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
      if quiz && quiz.update(require_quizzes_params)
        redirect_to quizzes_path
      else
        redirect_to new_quiz_path
      end
  end

  def edit
    @quiz = Quiz.find_by(id: params[:id])
  end

  def destroy
    quiz = Quiz.find_by(id: params[:id])
    quiz.destroy
    redirect_to new_quiz_path    
  end

  def take_quiz
    puts "================="
    quiz = Quiz.find_by(id: params[:id])
    question_ans = quiz.questions.joins(:answers)
    @ques_ans  = []
    puts question_ans,"00000000000000"

    question_ans.each do |ques|
    @ques_ans << construct_quiz_obj(ques)
    end
 puts  @ques_ans
  end

  private

  def require_quizzes_params
    params.permit(:title, :status, :no_of_questions)
  end
end




