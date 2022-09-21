class MotorcyclesController < ApplicationController
  def index
    @motorcycles = current_user.motorcycles.all
  end

  def show
    @motorcycle = Motorcycle.find(params[:id])
  end

  def new
    @motorcycle = current_user.motorcycles.new
  end

  def create
    @motorcycle = current_user.motorcycles.new(motorcycle_params)

    if @motorcycle.save
      flash[:success] = 'Bike added successfully'
      redirect_to motorcycles_path
    else
      flash.now[:error] = 'Error: Bike could not be added'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @motorcycle = Motorcycle.find(params[:id])
    if @motorcycle.destroy
      flash[:success] = 'Motorcycle was successfully deleted.'
      redirect_to motorcycles_path
    else
      flash[:error] = 'Something went wrong'
      render :show
    end
  end

  private

  def motorcycle_params
    my_motorcycle = params.require(:motorcycle).permit(:bike_name, :details, :image, :user_id)
    my_motorcycle[:user] = current_user
    my_motorcycle
  end
end
