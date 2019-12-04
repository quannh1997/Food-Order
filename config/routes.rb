Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'static_pages#home'

  devise_for :users
  resources :restaurants
  resources :users

  # Code tự viết
  get '/restaurants/:id/menu', to: 'restaurants#showMenu' , as: 'menu'

  get '/theme' , to: 'restaurants#theme' , as: 'theme'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/EON51/index.html'
 get 'EON51' , to: 'static_pages#show' , as: 'EON51'
end
