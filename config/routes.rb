Rails.application.routes.draw do
  devise_for :users
  root to: 'coffee_shops#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :coffee_shops, only: [ :index, :show, :update, :create, :destroy ]
    end
  end

  get '/coffee_shops/my_shops', to: 'coffee_shops#display_user_shops', as: 'user_shops'
  get '/api_info', to: 'pages#api_info', as: 'api_info'

  resources :coffee_shops do
    resources :reviews, only: [:index, :new, :create, :destroy]
  end
end
