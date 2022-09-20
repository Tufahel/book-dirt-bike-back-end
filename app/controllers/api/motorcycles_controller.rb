class Api::MotorcyclesController < ApplicationController
  before_action :authenticate_user!
  def index
    @motorcycles = Motorcycle.all
    render json: @motorcycles
  end

  def show
    @motorcycle = Motorcycle.find(params[:id])
    render json: @motorcycle
  end

  def new
    @user = current_user.id
    @motorcycles = @user.motorcycles
    render json: @motorcycles
  end

  def create
    @motorcycle = Motorcycle.new(motorcycle_params)
    @motorcycle.user_id = current_user.id
    if @motorcycle.save
      render json: @motorcycle
    else
      render json: @motorcycle.errors.full_messages, status: 422
    end
  end

  def destroy
    @motorcycle = Motorcycle.find(params[:id])
    @motorcycle.destroy
    render json: @motorcycle
  end

  private

  def motorcycle_params
    params.require(:motorcycle).permit(:bike_name, :details, :image, :user_id)
  end
end
