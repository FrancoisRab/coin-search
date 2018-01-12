class SearchController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  @stores = policy_scope(Store).order(created_at: :desc)
  if params[:query].present?
    if params[:query].include? (0..300).to_s
      @search = Store.near(params[:query],5)
    end
    @search = Store.search(params[:query])
    raise
    authorize @search
  else
    @search = Store.all
    authorize @search
  end

 end
end

