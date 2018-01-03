class StoresController < ApplicationController

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
  end

  private

  def store_params
    params.require(:store).permit(:name, :category, :description, :address, :postcode)
  end

end
