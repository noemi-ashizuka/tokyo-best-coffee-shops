class CoffeeShopPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    record.user == user
  end

  def create?
    !user.nil?
  end

  def destroy?
    record.user == user
  end

  def display_user_shops?
    true
  end
end
