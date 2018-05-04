Rails.application.routes.draw do

  root 'static_pages#index'

  resources :users
  get 'signup', to: 'users#new'
  get 'account', to: 'users#show'
  get 'account/setting', to: 'users#edit'

  resources :circles
  get 'circles/:id/invite', to: 'circles#new_member', as: 'new_member'
  post 'circles/:id/invite', to: 'circles#create_member', as: 'create_member'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
