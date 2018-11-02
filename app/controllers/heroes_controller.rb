require 'faraday'
require 'digest'
require 'json'

class HeroesController < ApplicationController
  def index
    nowtimestamp = Time.now.to_i.to_s
    publickey = ENV['MARVEL_PUBLIC_KEY']
    hash = Digest::MD5.hexdigest "#{nowtimestamp}#{ENV['MARVEL_PRIVATE_KEY']}#{publickey}"

    conn = Faraday.new(:url => 'http://gateway.marvel.com')
    response = conn.get '/v1/public/characters', {:ts => nowtimestamp, :apikey => publickey, :hash => hash}
    jsonresponse = JSON.parse(response.body)
    @heroes = jsonresponse['data']['results']
  end
end
