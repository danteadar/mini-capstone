Rails.application.routes.draw do

  get "/" => "products#index"
  get "/products" => "products#index"
  post "/search" => "products#search"
  get "/products/new" => "products#new"
  post "/products/" => "products#create"
  # get "/products/buy/:id" => "products#buy"
  get "/products/show/:id" => "products#show"
  get "/products/edit/:id" => "products#edit"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"
  get "/products/:id" => "aplication#sale_message"

  get "/images/new" => "images#new"
  post "/images" => "images#create"

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  get "/orders/:id" => "orders#show"
  post "/orders" => "orders#create"

  get "/carted_products" => "carted_products#index"
  post "/carted_products" => "carted_products#create"
  delete "/carted_products/:id" => "carted_products#destroy"






  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
