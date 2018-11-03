class HeroesController < ApplicationController
  def index
    limit = 20

    # Si el parámetro no existe entonces la expr evalua a nil.to_i que termina
    # en 0
    @pagina = request.query_parameters[:pagina].to_i

    # Es ultra unexpected que se autodefina 0 en vez de nil.. asi que
    # necesitamos esto
    @pagina = 1 if @pagina <= 0
    offset = (@pagina - 1) * limit
    data = MarvelHeroesService.get_heroes(offset)['data']
    total = data['total']

    @heroes = data['results']
    @paginas = (total.to_f / limit).ceil

    # Queremos entregar las paginas mostrables a la view
    # Este array en el mejor de los casos es normal, p. ej, cuando tenemos
    # [12, 13, 14, 15, 16].
    # Pero tenemos los casos anormales en que @pagina es 1, 2, total o total-1
    # En dichos casos simplemente haremos un shift
    mostrables = ((@pagina-2)..(@pagina+2)).to_a

    shift = 0
    case @pagina
    when 1
      shift = +2
    when 2
      shift = +1
    when @paginas
      shift = -2
    when @paginas - 1
      shift = -1
    end

    @paginas_mostrables = mostrables.map{|x| x + shift}
  end

  def show
    id = params[:id]
    data = MarvelHeroesService.get_heroe(id)['data']

    @heroe = data["results"].first
  end
end
