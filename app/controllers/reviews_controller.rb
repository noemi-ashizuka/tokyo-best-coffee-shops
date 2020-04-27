class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @coffee_shop = CoffeeShop.find(params[:coffee_shop_id])
    @review = Review.new
    @review.coffee_shop = @coffee_shop
    authorize @review
  end

  def create
    @coffee_shop = CoffeeShop.find(params[:coffee_shop_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.coffee_shop = @coffee_shop
    authorize @review
    if @review.save
      redirect_to coffee_shop_path(@coffee_shop)
    else
      flash[:alert] = "Something went wrong when creating the review. Please try again."
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
