Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  post 'home/index'
  post 'home/create'
  get 'home/destroy'
  post 'home/search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
