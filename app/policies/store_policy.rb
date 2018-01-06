class StorePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true   # Anyone can view a store
  end

  def show?
    true  # Anyone can view a store
  end

  def create?
    user.present?  # only register user
  end

  def update?
    return true if user.present? && user == store.user #Only store creator can update it
  end

  def destroy?
    return true if user.present? && user == store.user # Only store creator can delete it
  end


  private

  def store
    record
  end
end
