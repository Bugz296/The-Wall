Rails.application.routes.draw do
  root 'users#new'
  post 'logout' => 'users#logout'
  resources :users
  resources :messages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
