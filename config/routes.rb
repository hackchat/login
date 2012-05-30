HackchatAuth::Application.routes.draw do
  get "sessions/new"

  get "users/new"

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  resources :users
  resources :sessions
  get "secret" => "home#secret", :as => "secret"
  root :to => "home#index"
end
