Rails.application.routes.draw do
  
  get 'admin/admin'
  get "login" => "sessions#login"
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
