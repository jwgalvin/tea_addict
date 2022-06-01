Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :customer, only: %i[show] do
        resources :subscribe, only: %i[create, edit], controller: :subscriptions
        resources :current, only: %i[index], controller: :subscriptions
      end
      resources :tea, only: %i[show]
    end
  end
end
