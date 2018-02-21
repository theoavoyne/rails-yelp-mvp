class ReviewsController < ApplicationController
  before_action :find_restaurant, only: [ :index, :new, :create ]

  def index
    @reviews = @restaurant.reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :restaurant_id)
  end

  def find_restaurant
    @id = params[:restaurant_id]
    @restaurant = Restaurant.find(@id)
  end
end
