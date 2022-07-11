class CurrentUserController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user, except: [:index, :create]

  def index
    render json: current_user, status: :ok
  end

  def create
    user = User.create!(user_params)

    render json: json = {
      status: 201, 
      message: "User registered!",
      user: user.email,
      role: user.role,
      name: user.name
    }, status: :ok
  end

  def update
    @user.update!(user_params)

    render json: json = {
      status: 201, 
      message: "User updated!",
      user: @user
    }, status: :ok
  end

  def show
    render json: @user
  end

  def delete
    @user.destroy

    render json: json = {
      status: 200, 
      message: "User removed!"
    }, status: :ok
  end

  private

  def user_params 
    params.require(:user).permit(:email, :password, :name, :phone_number)
  end

  def get_user
    @user = User.find(params[:id])
  end
end