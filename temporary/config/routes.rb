Rails.application.routes.draw do
  resources :flats
  root 'flats#index'
end
