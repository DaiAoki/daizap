class User::RecordsController < User::ApplicationController
  before_action :redirect_if_noregister_user
  before_action :set_current_user

  def index
    # TODO: To investigate cause of below issue.
    # Process below is unnecessary, only for countermeasure with 204 error.
    # 一定時間待機するとうまくいくから、Rails5の中でマルチスレッドで動作していて、処理が早すぎてテンプレないと判断される??
    # というより、ファイルに変更加えたらうまくいく。原因不明。
    sleep(2)
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
