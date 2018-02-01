require 'json'
require 'open-uri'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @store_all = Store.all
    @stores = Store.where.not(latitude: nil, longitude: nil)
    @markers = @stores.map do |store|
      {
        lat: store.latitude,
        lng: store.longitude,
        infoWindow: { content: '<a href="/stores/' + store.id.to_s + '">' + store.name + '</a><br/>' +
                               store.category +
                               '<br>' +
                               store.address
        }
      }
    end
    url = 'https://api.coinmarketcap.com/v1/ticker/?limit=2'
    url_cryptos = open(url).read
    @cryptos = JSON.parse(url_cryptos)
  end

  def contact
  end
end

