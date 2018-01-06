class ProfilesController < ApplicationController
  def index

    @stores = policy_scope(Store)
  end
end
