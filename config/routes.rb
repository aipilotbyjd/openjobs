Rails.application.routes.draw do
  resources :profiles
  devise_for :companies
  devise_for :users
  resources :jobs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/jobs/:id/apply(:format)", to: "jobs#apply"
  post "/jobs/oneclickapply", to: "jobs#oneclickapply"
  # Defines the root path route ("/")
  root "jobs#index"
end
