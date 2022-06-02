Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customer, only: %i[show] do
        put 'subscribe', to: 'subscriptions#update'
        resources :subscribe, controller: :subscriptions
        resources :current, only: %i[index], controller: :subscriptions
      end
      resources :tea, only: %i[show]
    end
  end
end
