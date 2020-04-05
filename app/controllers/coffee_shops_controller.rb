class CoffeeShopsController < ApplicationController
  def index
    @coffee_shops = policy_scope(CoffeeShop)
  end
end
