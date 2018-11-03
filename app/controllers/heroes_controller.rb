class HeroesController < ApplicationController
  def index
    data = MarvelHeroesService.get_heroes(0)['data']

    @heroes = data['results']
    @limit = data['limit']
    @offset = data['offset']
    @count = data['count']
  end

  def show
    @id = params[:id]
  end
end
