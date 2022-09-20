class Api::RentalsController < ApplicationController
  def index
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

  private

  def rental_params
    params.require(:rental).permit(:book_date, :city, :motorcycle_id, user_id: current_user.id)
  end
end
