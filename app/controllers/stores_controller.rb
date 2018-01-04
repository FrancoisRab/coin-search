class StoresController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    @store.user = current_user
    if @store.save
      redirect_to store_path(@store)
    else
      render :new
    end
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy
    redirect_to store_path
  end

  private

  def store_params
    params.require(:store).permit(:name, :category, :description, :address, :postcode)
  end

end
