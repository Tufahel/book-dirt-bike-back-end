class Api::RentalsController < ApplicationController
  def index
  @rentals = Rental.all
  render json: @rentals
  end

  def show
  @rental = Rental.find(params[:id])
  render json: @rental
  end

  def create; end

  def new
    @user = current_user.id
    @rentals = @user.rentals
    render json: @rentals
  end

  def destroy
    
  end

  def params
    params.require(:rentals).permit(:user_id, :motorcycle_id, :book_date, :return_date, :city)
  end
  
end
