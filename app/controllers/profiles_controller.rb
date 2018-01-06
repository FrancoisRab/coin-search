class ProfilesController < ApplicationController
  def index
    @magasins = Store.where(user: current_user)
    @stores = policy_scope(Store)
  end
end
