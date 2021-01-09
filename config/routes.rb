Rails.application.routes.draw do
  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  get '/logout' => 'sessions#destroy'
  get '/account' => 'users#show'
  get 'account/recipes' => 'users#recipes'
  get 'shopping_list' => 'meal_plans#shopping_list'
  resources :meal_plans
  resources :categories
  resources :users, :only => [:new, :create]
  resources :recipes
end
