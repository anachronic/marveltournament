class PeleasController < ApplicationController
  def pelear
    if (pelea = PeleasService.pelear)
      @peleador = pelea[:persona]
      @heroe = pelea[:heroe]
      @registro = pelea[:registro]
    end
  end

  def index
    @peleas = Pelea.order(created_at: :desc).take(10)
  end
end
