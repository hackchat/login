HackchatAuth::Application.routes.draw do
  get "authorizations/new"

  get "password_resets/create"

  get "password_resets/edit"

  get "password_resets/update"

  get "sessions/new"

  get "users/new"

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  resources :users
  resources :sessions
  get "secret" => "home#secret", :as => "secret"
  root :to => "home#index"
  resources :password_resets
end