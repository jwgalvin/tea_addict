Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :customer, only: %i[create, index, show]
      resources :tea, only: %i[show]
      resources :subscription, only: %i[create, edit]
    end
  end
end
