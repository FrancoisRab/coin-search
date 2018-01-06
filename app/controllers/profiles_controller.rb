class ProfilesController < ApplicationController
  def index
    @stores = policy_scope(Store)
    @magasins = Store.where(user: current_user)
  end
end
