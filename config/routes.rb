Rails.application.routes.draw do

  get "login" => "sessions#showLogin"
  post "login" => "sessions#login"

  scope 'admin' do
    get "/" => "admins#index"
    get "login" => "sessions#login"
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
