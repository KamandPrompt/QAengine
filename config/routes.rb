Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#index"
  get "/signup" => "users#signup"
  post "/newuser"  => "users#create"
  get "/login" => "sessions#login"
  get "/create_session" => "sessions#create_session"
  delete "/logout" => "sessions#destroy"
end
