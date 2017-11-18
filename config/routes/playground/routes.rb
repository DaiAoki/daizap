Rails.application.routes.draw do
  namespace :playground do
    resources :samples
  end
end
