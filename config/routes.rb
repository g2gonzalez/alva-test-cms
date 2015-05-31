Rails.application.routes.draw do
  root 'menus#index'
  get '/drinks' => 'drinks#index'
end
