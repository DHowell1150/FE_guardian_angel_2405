class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    new_user = User.create(user_params)
    flash[:success] = "Welcome, #{new_user.username}!"
    redirect_to user_dashboard_index_path
  end

  def update
  end
  
  def edit
  end

  def login_form
  end

  def login
    user = User.find_by(email: params[:email])
    flash[:success] = "Welcome, #{user.first_name}!"
    redirect_to users_dashboard_index_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :phone_number)
  end
end