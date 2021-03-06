class CurrentUserController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin, except: [:show, :index, :user_list]
  before_action :authenticate_superadmin, only: [:create_admin]
  before_action :get_user, except: [:index, :create, :create_admin, :user_list]

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

  def user_list
    if current_user.role == 'Superadmin'
      users = User.where.not(role: 'Superadmin')
    else
      users = User.where(role: 'User')
    end

    render json: users
  end

  private

  def user_params 
    params.require(:user).permit(:email, :password, :name, :phone_number, :role)
  end

  def get_user
    @user = User.find(params[:id])
  end

  def authenticate_admin
    render json: json = {
      status: 401, 
      message: 'Unauthorized user.',
    }, status: :unauthorized if current_user.role == 'User'
  end

  def authenticate_superadmin
    render json: json = {
      status: 401, 
      message: 'Unauthorized user.',
    }, status: :unauthorized unless current_user.role == 'Superadmin'
  end
end