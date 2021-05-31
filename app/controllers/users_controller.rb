class UsersController < ApplicationController
  include UsersHelper
  include ApplicationHelper

  before_action :current_user, :logged_in?

  def create
    @user = @user || User.find_by(email: params[:email]) || User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to root_path
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
