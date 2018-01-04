class SearchController < ApplicationController
  skip_before_action :authenticate_user!

  def index
   if params[:query].present?
     @stores = Store.search(params[:query])
   else
     @stores = Store.all
   end
 end
end
