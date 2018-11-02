Rails.application.routes.draw do
  resources :peleas
  resources :personas
  get 'ranking', to: "ranking#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Nuestro controller index=>hello mostrará el "dashboard"
  root controller: :index, action: :hello
end
