class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    # raise params.inspect
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:name, :storename, :email, :username, :password, :image_url)
  end

  def test

  end
end
