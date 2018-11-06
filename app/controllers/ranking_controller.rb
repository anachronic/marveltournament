class RankingController < ApplicationController
  def index
    @personas = Persona.where("puntos > 0").order(puntos: :desc)
  end

  def reset
    PeleasService.reset_ranking
    redirect_to ranking_path, notice: "Ranking reseteado"
  end
end
