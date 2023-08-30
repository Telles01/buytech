Rails.application.routes.draw do
  devise_for :users
  # root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "products#index"

  resources :products do
    get "user", on: :collection
    resources :orders, only: [:new, :create]
  end

  get '/orderConfirmation', to: 'orders#order_confirmation'
end
