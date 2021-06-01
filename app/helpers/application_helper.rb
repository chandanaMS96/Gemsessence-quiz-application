module ApplicationHelper

  def current_user
    if session[:user_id]
      @user = User.find_by(id:session[:user_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def is_admin?
    puts "333333333333"
    if @user && @user.role == "admin"
      true
    else
      redirect_to root_path
    end
  end
  
end
