class SearchController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  if params[:search].present?
    @search = Store.search(params[:search])
    authorize @search
  else
    @search = Store.all
    authorize @search
  end
  @stores = policy_scope(Store).order(created_at: :desc)
 end
end
