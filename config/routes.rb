Rails.application.routes.draw do
  resources :users, only: [:create, :show]
  get "/signup", to: "users#new"
  get "/login", to: "session#new"
  post "/sessions", to: "session#create"
  delete "/sessions", to: "session#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
