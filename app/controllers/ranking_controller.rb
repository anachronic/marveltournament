class RankingController < ApplicationController
  def index
    @personas = Persona.where("puntos > 0").order(puntos: :desc)
  end
end
