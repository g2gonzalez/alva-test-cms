Rails.application.routes.draw do
  # home path
  root 'menus#index'
  # drinks home path
  get '/drinks' => 'drinks#index'
  # add new item form path
  get '/menus/new' => 'menus#new'
  # send form data path
  post '/menus' => 'menus#create'
  # edit form path
  get '/menus/edit' => 'menus#edit'
  # update form data path
  post '/menus/update' => 'menus#update'
end
