Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  get 'admin/dashboard', action: :index, controller: 'admin'
  get 'admin/dashboard/create', action: :showCreate, controller: 'admin'
  post 'admin/dashboard/create', action: :create, controller: 'admin'
  get 'admin/dashboard/:id/edit', action: :showEdit, controller: 'admin'
  put 'admin/dashboard/:id/edit', action: :update, controller: 'admin'
  delete 'admin/dashboard', action: :delete, controller: 'admin'
  # get 'admin/dashboard/edit:id', action: edit, controller: 'admin'
  root to: "home#index"
end
