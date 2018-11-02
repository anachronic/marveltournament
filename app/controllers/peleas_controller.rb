class PeleasController < ApplicationController
  def pelear
    @ganador = "Spiderman"
  end

  def index
    @peleas = [["Spiderman", "Pepe", "Spiderman"], ["Wolverine", "Pedro", "Pedro"]]
  end
end
