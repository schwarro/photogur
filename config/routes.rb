Rails.application.routes.draw do
  root 'pictures#index'
  # get 'pictures' => 'pictures#index'
  #
  # post 'pictures' => 'pictures#create'
  # get 'pictures/new' => 'pictures#new'
  #
  # get 'pictures/:id' => 'pictures#show'
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  # get 'pictures/:id/edit' => "pictures#edit"
  # patch 'pictures/:id' => "pictures#update"
  #
  # delete 'pictures/:id' => 'pictures#destroy'

  resources :pictures
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

end
