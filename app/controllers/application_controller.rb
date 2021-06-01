class ApplicationController < ActionController::Base
    before_action  :current_user,:logged_in? 
end
