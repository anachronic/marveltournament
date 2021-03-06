Rails.application.routes.draw do
  resources :personas
  post 'personas/:id/revivir', to: "personas#revivir", as: :personas_revivir

  # Heroes
  get 'heroes', to: "heroes#index", as: :heroes_index
  get 'heroes/:id', to: "heroes#show", as: :heroes_show

  # Peleas
  get 'peleas', to: "peleas#index"
  get 'peleas/pelear', to: "peleas#pelear"

  # Ranking
  get 'ranking', to: "ranking#index"
  post 'ranking/reset', to: "ranking#reset", as: :reset_ranking

  # Acerca
  get 'acerca', to: "acerca#index", as: :acerca

  # Index (dashboard)
  root controller: :index, action: :hello
end
