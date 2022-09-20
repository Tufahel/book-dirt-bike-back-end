class Api::RentalsController < ApplicationController
  def index
    @rentals = Rental.all
    render json: @rentals
  end

  def show
    @rentals = current_user.rentals
    render json: { rentals: @rentals }.to_json
  end

  def create
    @rental = current_user.rentals.new(rental_params)
    if @rental.save
      render json: @rental, status: :created, location: @rental
    else
      render json: @rental.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @rental = rental.find(params[:id])
    @rental.destroy
    render json: @rental
  end

  def new
    @user = current_user.id
    @rentals = @user.rentals
    render json: @rentals
  end

  private

  def rental_params
    params.require(:rentals).permit(:book_date, :return_date, :city, :motorcycle_id, user_id: current_user.id)
  end
end
