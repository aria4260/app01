Rails.application.routes.draw do
  post "users/create" => "users#create"
  get 'signup' => "users#new"
  get 'users/index' => "users#index"
  get 'users/:id' => "users#show"


  root to: 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
