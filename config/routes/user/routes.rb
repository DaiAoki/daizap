Rails.application.routes.draw do
  scope module: :user do
    controller :auths, trailing_slash: true do
      get  :register
      post :register_do
      get  :login
      post :login_do
    end

    resources :contributes, only: %w(index), trailing_slash: true do
    end

    resources :records, only: %w(index), trailing_slash: true do
    end
  end
end
