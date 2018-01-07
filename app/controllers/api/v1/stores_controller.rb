class Api::V1::StoresController < Api::V1::BaseController
  before_action :set_restaurant, only: [ :show ]

  def index
    @stores = policy_scope(Store)
  end

  def show
  end

  private

  def set_restaurant
    @store = Store.find(params[:id])
    authorize @store  # For Pundit
  end
end
