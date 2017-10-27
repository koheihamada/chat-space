Rails.application.routes.draw do
  root :to => 'groups#index'
  devise_for :users
  resources :groups, only: [:new, :create, :index, :edit] do
    resources :messages, only: [:index, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:edit, :update]
end
