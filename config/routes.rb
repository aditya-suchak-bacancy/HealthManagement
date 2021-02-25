Rails.application.routes.draw do
  root "users#new"
  #resources :blood_sugar_detail ,only: [:destroy]
  resources :users, only: [:create, :show, :new,:edit,:update]
  #get "/signup", to: "users#new"
  resources :session, only: [:new,:create, :destroy]
  # get "/login", to: "session#new"
  # post "/sessions", to: "session#create"
  # delete "/sessions", to: "session#destroy"
  #post "/user/:id", to: "blood_sugar_details#create", as: "blood_sugar"
  get "/user/:user_id/index", to: "blood_sugar_details#index", as: "show_blood_sugar"
  post "user/:user_id/new", to: "blood_sugar_details#create", as: "new_blood_sugar"
  get "user/:user_id/new", to: "blood_sugar_details#new"
  delete "/user/:user_id/index" , to: "blood_sugar_details#destroy", as: "delet_blood_sugar"
end
