class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    
    if @restaurant.save 
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
      # The unprocessable_entity status code indicates that the client submitted invalid data, and the server was unable to process the request.
      # Overall, this method definition handles the creation of a new restaurant object and provides a response to the client based on the success or failure of the save operation.
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
