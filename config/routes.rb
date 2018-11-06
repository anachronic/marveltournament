Rails.application.routes.draw do
  resources :personas

  # Heroes
  get 'heroes', to: "heroes#index", as: :heroes_index
  get 'heroes/:id', to: "heroes#show", as: :heroes_show

  # Peleas
  get 'peleas', to: "peleas#index"
  get 'peleas/pelear', to: "peleas#pelear"

  # Ranking
  get 'ranking', to: "ranking#index"
  post 'ranking/reset', to: "ranking#reset", as: :reset_ranking

  # Index (dashboard)
  root controller: :index, action: :hello
end
