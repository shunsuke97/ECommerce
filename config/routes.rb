Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root 'products#index'

  # resource :basket, only: [:show]と同義
  resource :basket, only: %i(show)
  resource :charge, only: %i(create)

  resources :products, only: %i(new show create) do
    scope module: :products do
      resources :add_to_baskets, only: %i(create)
      resources :delete_in_baskets, only: %i(create)
    end
  end

  namespace :admins do
    # /adminsにアクセスした際にdashboards#index
    root to: "dashboards#index"
    resources :products, only: %i(new create)
  end
end