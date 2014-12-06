Rails.application.routes.draw do
  root to: "static_pages#root"

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  post '/guest_sign_in', to: 'sessions#guest_sign_in', as: 'guest_sign_in'

  namespace :api, defaults: { format: :json } do
    resources :listings, except: [:new, :edit]
  end
end
