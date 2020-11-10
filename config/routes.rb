Rails.application.routes.draw do

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api, defaults: {format: 'json'} do
    devise_for :users
    resources :users, only: [] do
      collection do
        post :login
      end
    end
    namespace :users do
      resources :slots
      resources :appointments do
        collection do
          get ":doctor_id/appointments", to: "appointments#appointments"
        end
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
