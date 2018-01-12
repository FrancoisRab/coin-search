class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @stores = Store.where.not(latitude: nil, longitude: nil)

        @markers = @stores.map do |store|
          {
            lat: store.latitude,
            lng: store.longitude#,
            # infoWindow: { content: render_to_string(partial: "/stores/map_box", locals: { store: store }) }
          }
        end
  end
  def google4d9e386ef35cdb35
  end
end

