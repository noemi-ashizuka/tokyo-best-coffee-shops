class Api::V1::CoffeeShopsController < Api::V1::BaseController
  def index
    @restaurants = policy_scope(CoffeeShop)
  end
end