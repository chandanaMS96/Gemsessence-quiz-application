class UsersController < ApplicationController
  include UsersHelper
  include ApplicationHelper

  def create
    @user = @user || User.find_by(email: params[:email]) || User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      if @user.role == "user"
        redirect_to root_path
      else
        redirect_to quizzes_path
      end
    else
      redirect_to new_user_path, notice: "Try again"
    end
  end

  def landing_page

  end

  def new

  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.permit(:name, :email, :phone_num)
  end



end
