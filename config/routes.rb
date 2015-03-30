Rails.application.routes.draw do
  root :to => 'twits#index'
  devise_for :users

  resources :twits
end
