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

    resources :records, trailing_slash: true do
    end
  end

  namespace :admin do
  end

  namespace :api, format: 'json' do
    namespace :v1 do
      resources :comments
    end
  end

  namespace :playground do
    resources :samples
  end

  root 'user/contributes#index'
end
