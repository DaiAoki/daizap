class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # for POST by curl command
  #protect_from_forgery with: :null_session
  helper_method :current_user    # Available to use method defined in controller from view

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
