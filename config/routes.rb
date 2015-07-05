Rails.application.routes.draw do
  # home path
  root 'menus#index'
  # drinks home path
  get '/drinks' => 'drinks#index'
  # update form data path
  post '/menus/update' => 'menus#update'

  resources :menus
end
