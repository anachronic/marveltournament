Rails.application.routes.draw do
  get 'peleas', to: "peleas#index"
  get 'ranking', to: "ranking#index"
  resources :personas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Nuestro controller index=>hello mostrará el "dashboard"
  root controller: :index, action: :hello
end
