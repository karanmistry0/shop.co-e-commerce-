Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index.html.erb"
  root "home#index"
  resources :products, only: [:show] do
  end
  resources :cart_item

  resources :order_payments, only: [:create]
  get 'order_payments/success',to:"order_payments#success"
end
