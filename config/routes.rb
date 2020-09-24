Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root 'products#index'

  resource :basket, only: %i(show)
  resource :charge, only: %i(create)

  resources :products, only: %i(new show create) do
    scope module: :products do
      resources :add_to_baskets, only: %i(create)
      resources :delete_in_baskets, only: %i(create)
    end
  end
end