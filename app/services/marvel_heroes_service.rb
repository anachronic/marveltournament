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
