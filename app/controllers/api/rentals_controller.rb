class Api::RentalsController < ApplicationController
  include Response
  def index
    @rentals = current_user.rentals
    render json: { rentals: @rentals }.to_json
  end

  def create
    @rental = current_user.rentals.new(rental_params)
    if @rental.save
      json_response(@rental, :created)
    else
      json_response(@rental.errors, :unprocessable_entity)
    end
  end

  def destroy
    @bike = current_motorcycle
    if @bike.nil?
      json_response({ error: 'Bike doesn\'t exist' }, :no_content)
    else
      @bike.destroy
      json_response({ message: 'Bike deleted successfully' }, :no_content)
    end
  end

  private

  def current_motorcycle
    @current_motorcycle = current_user.rentals.find(params[:id]) if current_user.rentals.exists?(params[:id])
  end

  def rental_params
    params.require(:rentals).permit(:book_date, :return_date, :city, :motorcycle_id, user_id: current_user.id)
  end
end
