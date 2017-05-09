Rails.application.routes.draw do
  resources :comments
  resources :pictures_tags
  resources :tags
  resources :pictures
  resources :users

  get '/login', to: 'sessions#new', as: 'new_session'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
