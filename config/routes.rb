HackchatAuth::Application.routes.draw do

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  resources :users
  resources :sessions
  get "secret" => "home#secret", :as => "secret"
  root :to => "sessions#new"
  resources :password_resets
  get "logged_in" => "sessions#logged_in", :as => "logged_in"
  resources :emails
end