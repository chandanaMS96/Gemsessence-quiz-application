class UserContestsController < ApplicationController
  before_action  :current_user,:logged_in? ,only: [:submit_quiz, :dashboard]
  include ApplicationHelper
  include UserContestsHelper
  def take_quiz
    quiz = Quiz.find_by(id: params[:id])
    question_ans = quiz.questions.includes(:answers).where.not(answers: {question_id: nil})
    @ques_ans  = []
    question_ans.each do |ques|
    @ques_ans << construct_quiz_obj(ques)
    end
  end

  def submit_quiz
    answers = params[:answers]
    user_contest_details = []
    answer_arr = answers.values
    answer_arr.each do |ans|
      ans_obj = {}
      ans_obj[:question_id] = ans["question_id"]
      ans_obj[:quiz_id] = ans['quiz_id']
      ans_obj[:is_correct] = ans[ans["answer_id"]]
      ans_obj[:answer_id] = ans['answer_id']
      ans_obj[:user_id] = @user.id
      user_contest =  UserContest.new(ans_obj)
      user_contest.save
    end
    redirect_to dashboard_path 
  end

  def dashboard
    user_contests = UserContest.where(user_id: @user.id).select{|x| x.is_correct == true}.group_by{|x| x.quiz_id}.to_h
    @quiz_details = []
    user_contests.each do |contest|
      quiz = Quiz.find_by(id: contest[0])
      unless quiz.blank?
        obj = {}
        puts contest[1]
        obj[:quiz_name] = quiz.title
        obj[:total_questions] = quiz.no_of_questions
        obj[:correct_ans] = contest[1].count
         @quiz_details << obj
      end
    end
    puts @quiz_details
  end
end
