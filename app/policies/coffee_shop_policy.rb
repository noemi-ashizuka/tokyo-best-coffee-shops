class CoffeeShopPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    record.user == user
  end

  def new?
    create?
  end

  def create?
    !user.nil?
  end

  def destroy?
    update?
  end

  def display_user_shops?
    true
  end
end
