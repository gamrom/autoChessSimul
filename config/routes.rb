Rails.application.routes.draw do
  devise_for :users
  root 'home#start'
  get 'home/index'
  post 'home/index' => 'home#index'
  post 'home/create'
  get 'home/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
