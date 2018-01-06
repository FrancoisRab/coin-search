class SearchController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  @stores = policy_scope(Store).order(created_at: :desc)
  if params[:query].present?
    @search = Store.search(params[:query])
    authorize @search
  else
    @search = Store.all
    authorize @search
  end
 end
end
