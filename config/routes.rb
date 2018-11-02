Rails.application.routes.draw do
  resources :personas

  # Heroes
  get 'heroes/index'

  # Peleas
  get 'pelear', to: "peleas#index"
  get 'peleas/pelear', to: "peleas#pelear"

  # Ranking
  get 'ranking', to: "ranking#index"

  # Index (dashboard)
  root controller: :index, action: :hello
end
