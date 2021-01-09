Rails.application.routes.draw do
  #resources :planners
  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  get '/logout' => 'sessions#destroy'
  get '/account' => 'users#show'
  resources :meals
  resources :categories
  resources :users, :only => [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :recipes
end
