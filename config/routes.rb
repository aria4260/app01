Rails.application.routes.draw do
#  resource :user
  resources :users

  get "/users/registered" => "users#registered"
  get "/users/:verify_token" => "users#token"

  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"

  resources :posts

  root to: 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
