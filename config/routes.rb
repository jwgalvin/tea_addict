Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customer, only: %i[show] do
        put 'subscribe', to: 'subscriptions#update'
        resources :subscribe, controller: :subscriptions
      end
      resources :tea, only: %i[index, show]
    end
  end
end
