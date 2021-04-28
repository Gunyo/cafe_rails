Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "cafe#index"
  get "/cafe", to: "cafe#about"
  post "/cafe", to: "cafe#create"
  get "/cafe/:item_name", to: "cafe#show", as: "show_item"
  patch "/cafe/:item_name", to: "cafe#update" 
  put "/cafe/:item_name", to: "cafe#update" 
end
