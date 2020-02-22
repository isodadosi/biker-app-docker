Rails.application.routes.draw do

 
  # get 'users/login', to: 'users#login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'contents#index'
  resources :contents
  resources :sessions, only: %i[new]
  resources :users, only: %i[new create index]
  resources :comments, only: %i[create destroy]
  resources :contents do
    get :search, on: :collection 
  end
end
