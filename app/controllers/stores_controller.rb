class StoresController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  def index
    @stores = policy_scope(Store).order(created_at: :desc)
    @stores2 = Store.where.not(latitude: nil, longitude: nil)

        @markers = @stores2.map do |store|
          {
            lat: store.latitude,
            lng: store.longitude,
            infoWindow: { content: '<a href="/stores/' + store.id.to_s + '">' + store.name + '</a><br/>' +
                                   store.category +
                                   '<br>' +
                                   store.address
            }
          }
        end
  end

  def show
    @store_user = @store.user_id
    @user = User.find(@store_user)
  end


  def new
    @store = Store.new
    authorize @store
  end

  def create
    @store = Store.new(store_params)
    authorize @store
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
    redirect_to profiles_path
  end

  private

  def set_store
    @store = Store.find(params[:id])
    authorize @store
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
