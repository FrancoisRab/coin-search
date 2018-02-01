require 'json'
require 'open-uri'

class ProfilesController < ApplicationController
  def index
    @magasins = Store.where(user: current_user)
    @stores = policy_scope(Store)

    url = 'https://api.coinmarketcap.com/v1/ticker/?limit=2'
    url_cryptos = open(url).read
    @cryptos = JSON.parse(url_cryptos)
  end
end
