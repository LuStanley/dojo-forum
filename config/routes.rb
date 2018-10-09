Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
  root "articles#index"

  resources :users, only: [:show, :edit, :update]

  namespace :admin do
    root "articles#index"
  end

end
