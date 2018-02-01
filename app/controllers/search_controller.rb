require 'json'
require 'open-uri'

class SearchController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_cryptos

  def index
  # recherche en fonction de ma position
  # recherche avec adresse
  # recherche avec nom

  @stores = policy_scope(Store).order(created_at: :desc)
  @user = request.ip

  if params[:query].present?
    @search = Store.near(params[:query], 2)
    authorize @search
  elsif params[:categorie].present?
    @search = Store.search(params[:categorie])
    authorize @search
  else
    @search = Store.all
    authorize @search
  end

      @markers = @search.map do |store|
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
 end

  private

  def set_cryptos
    url = 'https://api.coinmarketcap.com/v1/ticker/?limit=2'
    url_cryptos = open(url).read
    @cryptos = JSON.parse(url_cryptos)
  end
end

