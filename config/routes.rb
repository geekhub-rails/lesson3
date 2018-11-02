Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users
  get 'users/index'
  get 'users/new'
  get 'users/destroy'
  #get 'users/edit'
  get 'users/show'

  resources :users

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
