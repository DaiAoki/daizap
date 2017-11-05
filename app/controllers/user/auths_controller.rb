class User::AuthsController < User::ApplicationController

  def register
    # TODO
  end

  def register_do
    # TODO
  end

  def login
    @auth = AuthInformation.new
  end

  def login_do
    auth = AuthInformation.find_by(login_id: auth_params[:login_id])
    if auth && auth.authenticate(auth_params[:password])
      session[:user_id] = auth.user_id
      flash.now.notice = "Success"
      redirect_to hoge_path    # TODO
    else
      @auth = AuthInformation.new
      flash.now.alert = "Failure"
      render :login
    end
  end



  private

    def auth_params
      params.require(:auth_information).permit(:login_id, :password, :password_confirmation)
    end
end
