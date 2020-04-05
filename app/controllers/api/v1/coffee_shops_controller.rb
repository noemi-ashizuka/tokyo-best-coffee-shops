class Api::V1::CoffeeShopsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_coffee_shop, only: [:show, :update, :destroy]

  def index
    @coffee_shops = policy_scope(CoffeeShop)
  end

  def show
  end

  def update
    if @coffee_shop.update(coffee_shop_params)
      render :show
    else
      render_error
    end
  end

  def create
    @coffee_shop = CoffeeShop.new(coffee_shop_params)
    @coffee_shop.user = current_user
    authorize @coffee_shop
    if @coffee_shop.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @coffee_shop.destroy
    head :no_content
  end

  private

  def set_coffee_shop
    @coffee_shop = CoffeeShop.find(params[:id])
    authorize @coffee_shop
  end

  def coffee_shop_params
    params.require(:coffee_shop).permit(:name, :address)
  end

  def render_error
    render json: { errors: @coffee_shop.errors.full_messages },
      status: :unprocessable_entity
  end
end