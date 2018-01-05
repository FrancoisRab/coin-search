class StoresController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  def index
    @stores = Store.all
  end

  def show
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

  def edit
  end

  def update
    @store.update(store_params)
    redirect_to store_path(@store)
  end

  def destroy
    @store.destroy
    redirect_to stores_path
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name,
                                  :category,
                                  :description,
                                  :address,
                                  :postcode,
                                  :opening_hours,
                                  :crypto,
                                  :contact,
                                  :website,
                                  :photo)
  end

end
