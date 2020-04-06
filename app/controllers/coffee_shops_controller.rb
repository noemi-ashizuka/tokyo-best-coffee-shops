class CoffeeShopsController < ApplicationController
  def index
    @coffee_shops = policy_scope(CoffeeShop)
  end

  def show
    @coffee_shop = CoffeeShop.find(params[:id])
    authorize @coffee_shop
  end

  def new
    @coffee_shop = CoffeeShop.new
    authorize @coffee_shop
  end

  def create
    @coffee_shop = CoffeeShop.new(coffee_shop_params)
    @coffee_shop.user = current_user
    authorize @coffee_shop
    if @coffee_shop.save
      redirect_to coffee_shop_path(@coffee_shop)
    else
      render :new
    end
  end

  private

  def coffee_shop_params
    params.require(:coffee_shop).permit(:name, :address)
  end
end
