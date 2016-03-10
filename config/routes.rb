Rails.application.routes.draw do
  get "/auth/:provider/callback", to: "sessions#create"

  resources :bots, only: [] do
    get :ready, on: :collection
  end

  root to: "home#index"
end
