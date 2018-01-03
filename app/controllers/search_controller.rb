class SearchController < ApplicationController
  def index
   if params[:query].present?
     @stores = Store.search(params[:query])
   else
     @stores = Store.all
   end
 end
end
