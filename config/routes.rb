Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: redirect("/login")

   get "/login" => "dashboard#login", :as => :login
  resources :dashboard, only: [:create, :destroy, :show]
  
end
