Rails.application.routes.draw do
  devise_for :users
  # root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "products#index"

  resources :products do
    collection do
      get "my_products"
    end

    resources :orders, only: [:new, :create]
    get '/order_confirmation', to: 'orders#order_confirmation', as: :order_confirmation
    get '/order_no_buy', to: 'orders#order_no_buy', as: :order_no_buy
    get '/my_orders', to: 'orders#my_orders', as: :my_orders
  end
end
