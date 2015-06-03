Rails.application.routes.draw do
  root 'menus#index'
  get '/drinks' => 'drinks#index'
  get '/menus/new' => 'menus#new'
  post '/menus' => 'menus#create'
end
