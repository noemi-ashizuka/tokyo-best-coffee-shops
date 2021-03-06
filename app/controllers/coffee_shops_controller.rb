class CoffeeShopsController < ApplicationController
  before_action :set_coffee_shop, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  
  def index
    @coffee_shops = policy_scope(CoffeeShop.geocoded)

    if params[:query].present?
      @coffee_shops = CoffeeShop.search_by_name_address_and_description(params[:query])
    end

    @markers = @coffee_shops.map do |shop|
      {
        lat: shop.latitude,
        lng: shop.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { shop: shop }),
        id: shop.id
      }
    end
  end

  def show
    @review = Review.new
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

  def edit
  end

  def update
    if @coffee_shop.update(coffee_shop_params)
      redirect_to coffee_shop_path(@coffee_shop)
    else
      render :edit
    end
  end

  def destroy
    @coffee_shop.destroy
    redirect_to coffee_shops_path
  end

  def display_user_shops
    @user_shops = current_user.my_shops
    authorize @user_shops
  end

  private

  def set_coffee_shop
    @coffee_shop = CoffeeShop.find(params[:id])
    authorize @coffee_shop
  end

  def coffee_shop_params
    params.require(:coffee_shop).permit(:name, :address, :description, :photo)
  end
end
