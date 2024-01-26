Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    namespace :v0 do
      post '/customers/:customer_id/subscriptions', to: 'customers/subscriptions#create'
      patch '/customers/:customer_id/subscriptions/:subscription_id/cancel', to: 'customers/subscriptions#update'
      get '/customers/:customer_id/subscriptions', to: 'customers/subscriptions#index'
    end
  end
end
