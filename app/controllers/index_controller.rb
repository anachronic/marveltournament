class IndexController < ApplicationController
  def hello
    @personas = Persona.where("puntos > 0").order(puntos: :desc).take(5)
    @peleas = Pelea.joins(:persona).order(created_at: :desc).take(5)
  end
end
