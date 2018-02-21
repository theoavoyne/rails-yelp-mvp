class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [ :show ]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
  end

  private

  def find_restaurant
    @id = params[:id]
    @restaurant = Restaurant.find(@id)
  end
end
