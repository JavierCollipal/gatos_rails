Rails.application.routes.draw do

  resources :cats
  resources :breeds
  resources :colors
  resources :users

end
