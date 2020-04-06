class CoffeeShopsController < ApplicationController
  def index
    @coffee_shops = policy_scope(CoffeeShop)
  end

  def show
    @coffee_shop = CoffeeShop.find(params[:id])
    authorize @coffee_shop
  end
end
