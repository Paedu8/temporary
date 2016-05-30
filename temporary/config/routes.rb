Rails.application.routes.draw do
  devise_for :users
  resources :flats
  root 'flats#index'
end
