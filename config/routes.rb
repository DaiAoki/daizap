Rails.application.routes.draw do

  scope module: :user do
    controller :auths, only: %w(), trailing_slash: true do
      get  :register
      post :register_do
      get  :login
      post :login_do
    end
  end

  scope module: :admin do
  end
end
