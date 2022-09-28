class Api::RentalsController < ApplicationController
  include Response
  def index
    @rentals = Rental.all
    render json: { rentals: @rentals }.to_json
  end

  def show
    @rental = Rental.find(params[:id])
    render json: @rental
  end

  def create
    @rental = Rental.new(rental_params)
    if @rental.save
      json_response(@rental, :created)
    else
      json_response(@rental.errors, :unprocessable_entity)
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy
    render json: @rental
  end

  private

  def current_motorcycle
    @current_motorcycle = current_user.rentals.find(params[:id]) if current_user.rentals.exists?(params[:id])
  end

  def rental_params
    params.permit(:book_date, :return_date, :city, :motorcycle_id, :user_id)
  end
end
