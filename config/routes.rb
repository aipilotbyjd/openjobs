Rails.application.routes.draw do
  devise_for :companies
  devise_for :users
  resources :jobs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/jobs/:id/apply(:format)", to: "jobs#apply"
  # Defines the root path route ("/")
  root "jobs#index"
end
