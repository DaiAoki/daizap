Rails.application.routes.draw do
  namespace :api, format: 'json' do
    namespace :v1 do
      resources :comments, only: [:index, :create]
      resources :records, only: [:index, :create, :destroy]
    end
  end
end
