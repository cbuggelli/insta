Rails.application.routes.draw do
  resources :pictures_tags
  resources :pictures
  resources :users

  get '/login', to: 'sessions#new', as: 'new_session'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/', to: 'sessions#new', as: 'home'
  post '/pictures/:picture_id/comments', to: 'comments#create', as: 'comments'

  post '/pictures/:picture_id/tags', to: 'tags#create', as: 'tags'

  # post '/pictures/:picture_id/tags', to: 'tags#create', as: 'tags'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
