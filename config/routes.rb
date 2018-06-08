Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  # resources :users
  devise_for :admin
  get 'users' => 'users#index'
  post 'users' => 'users#admin_search'
end
