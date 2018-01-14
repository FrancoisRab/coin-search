class SearchController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  # recherche en fonction de ma position
  # recherche avec adresse
  # recherche avec nom

  @stores = policy_scope(Store).order(created_at: :desc)
  @user = request.ip

  if params[:query].present?
    if params[:distance].present?
      @search = Store.near(params[:query], params[:distance])
      authorize @search
    else
      @search = Store.near(params[:query], 2)
      authorize @search
    end
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
end

