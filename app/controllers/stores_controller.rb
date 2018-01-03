class StoresController < ApplicationController

  def index
    @stores = Store.all
  end

  def new
    @store = Store.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
