class PeleasController < ApplicationController
  def pelear
    if (pelea = PeleasService.pelear)
      @peleador = pelea[:persona]
      @heroe = pelea[:heroe]
      @registro = pelea[:registro]
    else
      redirect_to peleas_path, {notice: "No quedan peleadores vivos :("}
    end
  end

  def index
    @peleas = Pelea.includes(:persona).order(created_at: :desc).take(10)
  end
end
