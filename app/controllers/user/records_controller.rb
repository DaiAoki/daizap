class User::RecordsController < User::ApplicationController
  before_action :redirect_if_noregister_user
  before_action :set_current_user

  def index
  end


  private

  def redirect_if_noregister_user
    # TODO: セキュリティ的な観点からセッションにuser_idが保持されていたらログインしているとみなすのは弱い
    session[:user_id].present?
  end

  def set_current_user
    @user = User.find(session[:user_id]) if session[:user_id]
  end
end
