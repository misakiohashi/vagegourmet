Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'prefectures#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create] do
    member do
      get :restaurants
    end
  end
  
  resources :restaurants,only: [:index,:new,:edit,:create,:update,:destroy]
  resources :categories,only: [:new,:create,:edit,:update,:destroy]
  resources :cities
  resources :prefectures
  resources :areas,only: [:new,:create,:edit,:update,:destroy]
  resources :favorites, only: [:create, :destroy]
  
  #index、show、new、edit,create、update、destroy
  
end
