class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(session[:current_user_id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to "/users/test"
    else
      render :edit
    end
  end

  def create
    # raise params.inspect
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'The User is successfully saved!'
      redirect_to root_path
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:name, :storename, :email, :username, :password, :image_url)
  end

  def orderfulfillment
    userproducts = User.find(session[:current_user_id]).products
    @orderfulfillment = userproducts.collect {|userproduct| Orderitem.all.where( product_id: userproduct.id) }
  end
end
