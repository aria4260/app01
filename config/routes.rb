Rails.application.routes.draw do
  get "login" => "users#login_form"
  post "login" => "users#login"
  get "logout" => "users#logout"

#  resource :user
  resources :users, param: :verify_token  do
    #idあり
    member do
      get 'mypage'
      get 'auth'
      patch 'auth_update'
    end
    #idなし
    collection do
      get 'reg'
    end
  end

  resources :posts

  root to: 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
