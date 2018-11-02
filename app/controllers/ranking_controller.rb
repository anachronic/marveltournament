class RankingController < ApplicationController
  def index
    @thekey = ENV['MARVEL_PUBLIC_KEY']
  end
end
