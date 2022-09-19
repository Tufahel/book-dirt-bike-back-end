class Api::UsersController < ApplicationController
  def index
    @all_users = User.all

    render json: @all_users
  end

  def show
    @user = User.find(params[:id])

    render json: @user
  end
end
