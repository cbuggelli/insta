Rails.application.routes.draw do
  resources :comments
  resources :pictures_tags
  resources :tags
  resources :pictures
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
