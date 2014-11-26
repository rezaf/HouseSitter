Rails.application.routes.draw do
  root to: "static_pages#root"

  resources :users, only: :new
  resource :session, only: :new
end
