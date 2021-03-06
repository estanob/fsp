Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#root'
  
  resources :pictures, only: :show
  
  namespace :api, defaults: {format: :json} do
    resources :users, only: [:show, :create]
    resources :pictures, only: [:index, :show, :create, :update, :destroy]
    resources :galleries, only: [:index, :show, :create, :update, :destroy]
    resource :session, only: [:create, :destroy]
  end
end
