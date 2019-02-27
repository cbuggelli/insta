Rails.application.routes.draw do
  resources :relationships
  resources :pictures_tags
  resources :pictures
  resources :users do
    member do
      get :following, :followers
    end
  end

  get '/login', to: 'sessions#new', as: 'new_session'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  # get '/', to: 'sessions#new', as: 'home'
  post '/pictures/:picture_id/comments', to: 'comments#create', as: 'comments'
  post '/pictures/:picture_id/tags', to: 'tags#create', as: 'tags'
  post '/pictures/new', to: 'pictures#new', as: 'new_pic'

  get '/tags/:id', to: 'tags#show', as: 'tag'

  # post '/pictures/:picture_id/tags', to: 'tags#create', as: 'tags'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
