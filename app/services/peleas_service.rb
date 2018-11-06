# coding: utf-8
class PeleasService
  @@peleador = nil

  # Contiene una lista con ids de heroes que ya pelearon hoy
  @@heroes_con_peleas = []

  class << self
    def pelear
      reset_peleador if @@peleador.nil?
      return unless existen_vivos

      heroe = MarvelHeroesService.get_random_heroe

      # Determinar el ganador
      chance = 50 + @@peleador.puntos
      rng = 1 + rand(100)
      gana_heroe = rng > chance

      registro = Pelea.new
      registro.persona_id = @@peleador.id
      registro.heroe_id = heroe["id"]
      registro.nombre_heroe = heroe["name"]
      registro.gana_heroe = gana_heroe

      if registro.save
        # Ok, quedó grabado todo, ahora la lógica de la app

        if gana_heroe
          @@peleador.alive = false
        else
          @@peleador.puntos += 1
        end

        @@peleador.save
        @@heroes_con_peleas.append(heroe["id"])
        # Ahora que guardamos al peleador, hay que retornar el que peleó pero
        # debemos cambiar la variable de clase si gana el héroe
        persona = @@peleador

        reset_peleador if gana_heroe

        {:persona => persona, :heroe => heroe, :registro => registro}
      else
        false
      end
    end

    def heroe_ha_peleado(id)
      @@heroes_con_peleas.include?(id)
    end

    def reset_ranking
      Pelea.destroy_all
      Persona.update_all("puntos = 0, alive = 'true'")
      @@heroes_con_peleas = []

      # También reseteamos el peleador
      reset_peleador
    end

    private

    def reset_peleador
      vivos = Persona.where(alive: true)

      return false if vivos.count == 0
      total_personas = vivos.count
      @@peleador = vivos.offset(rand(total_personas)).first
    end

    def existen_vivos
      vivos = Persona.where(alive: true)

      vivos.count > 0
    end
  end
end
