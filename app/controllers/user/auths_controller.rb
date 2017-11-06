class User::AuthsController < User::ApplicationController

  def register
    @user = User.new
    @user.build_auth_information
  end

  def register_do
    @user = User.create(user_params)
    @user.save!
    redirect_to hoge_path, notice: 'Success'    # TODO
  rescue ActiveRecord::RecordInvalid
    redirect_to :back, alert: 'Failuer'
  end

  def login
    @auth = AuthInformation.new
  end

  def login_do
    auth = AuthInformation.find_by(login_id: auth_params[:login_id])
    if auth && auth.authenticate(auth_params[:password])
      session[:user_id] = auth.user_id
      redirect_to hoge_path, notice: 'Success'    # TODO
    else
      redirect_to :back, alert: 'Failuer'
    end
  end



  private

    def auth_params
      params.require(:auth_information).permit(:login_id, :password, :password_confirmation)
    end

    def user_params
      params.require(:user).permit(
        :name, :handle_name, :role,
        auth_information_attributes: [
          :login_id, :password, :password_confirmation, :secret_question, :secret_answer, :user_id
        ]
      )
    end
end
