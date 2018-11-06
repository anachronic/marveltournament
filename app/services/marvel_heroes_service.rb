require 'faraday'
require 'digest'
require 'json'

class MarvelHeroesService
  ENDPOINT = "http://gateway.marvel.com"

  class << self

    def get_heroes(offset)
      path = "/v1/public/characters"

      conn = get_connection
      params = get_params
      params[:offset] = offset
      params[:limit] = 20
      response = conn.get(path, params)

      JSON.parse(response.body)
    end

    def get_heroe(id)
      path = "/v1/public/characters/#{id}"

      conn = get_connection
      params = get_params
      response = conn.get(path, params)

      JSON.parse(response.body)
    end

    def get_random_heroe
      path = "/v1/public/characters"

      conn = get_connection
      params = get_params
      response = conn.get(path, params)

      # Tomamos uno de los tantos al azar
      heroes_total = JSON.parse(response.body)["data"]["total"].to_i
      elegido = rand(heroes_total)

      # Hacemos un request con offset = elegido
      params = get_params
      params[:offset] = elegido
      response = conn.get(path, params)

      results = JSON.parse(response.body)["data"]["results"]
      index = 0
      results.each do |heroe|
        return results[index] unless PeleasService.heroe_ha_peleado(heroe["id"])
        index = index + 1
      end

      # URGH! Todos los heroes pelearon? repetir..
      get_random_heroe
    end

    private

    def get_connection
      Faraday.new(:url => ENDPOINT)
    end

    def get_params
      nowtimestamp = Time.now.to_i.to_s
      publickey = ENV['MARVEL_PUBLIC_KEY']
      hash = Digest::MD5.hexdigest("#{nowtimestamp}#{ENV['MARVEL_PRIVATE_KEY']}#{publickey}")

      { :apikey => publickey, :ts => nowtimestamp, :hash => hash }
    end
  end
end
