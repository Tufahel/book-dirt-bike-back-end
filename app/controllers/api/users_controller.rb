class Api::UsersController < ApplicationController
  def index
    @all_users = User.all
    render json: @all_users
  end
end
