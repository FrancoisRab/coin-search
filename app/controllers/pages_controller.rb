class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @store = Store.all
    @stores = Store.where.not(latitude: nil, longitude: nil)

        @markers = @stores.map do |flat|
          {
            lat: flat.latitude,
            lng: flat.longitude#,
            # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
          }
        end
  end
end
