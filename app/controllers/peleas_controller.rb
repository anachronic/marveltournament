class PeleasController < ApplicationController
  def pelear
    # Tomamos una persona al azar
    offset = rand(Persona.count)
    @peleador = Persona.offset(offset).first

    # Escoger un héroe (de marvel) al azar
    @ganador = "Spiderman"
  end

  def index
    @peleas = [["Spiderman", "Pepe", "Spiderman"], ["Wolverine", "Pedro", "Pedro"]]
  end
end
