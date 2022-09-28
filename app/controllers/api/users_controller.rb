class Api::UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def show
    users = User.all
    render json: users
  end
end
