Rails.application.routes.draw do
  devise_for :users
  get 'merchants/index'
  root to: 'markets#index'
  resources :markets, only: [:index, :show] do
    resources :merchants, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
