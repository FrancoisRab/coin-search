class SearchController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  @stores = policy_scope(Store).order(created_at: :desc)
  if params[:query].present?
    @search = Store.near(params[:query], 1)
    authorize @search
  else
    @search = Store.all
    authorize @search
  end

  # if params[:location].present?
  #   @search = Store.near(params[:location], params[:distance] || 10, order: :distance)
  # else
  #   @search = Store.all
  # end

    user_ip2 = request.ip
    raise
 end
end

