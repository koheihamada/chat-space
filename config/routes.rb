Rails.application.routes.draw do
  root :to => 'messages#index'
  devise_for :users
  resources :groups, only: [:new, :create, :edit] do
    resources :messages, only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:edit, :update]
end
