Rails.application.routes.draw do
  resource :user
  resources :users, only: [:index, :show]

  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"

  root to: 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
