class Api::V1::CoffeeShopsController < Api::V1::BaseController
  before_action :set_coffee_shop, only: [:show]
  def index
    @coffee_shops = policy_scope(CoffeeShop)
  end

  def show
  end

  private

  def set_coffee_shop
    @coffee_shop = CoffeeShop.find(params[:id])
    authorize @coffee_shop
  end
end