class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    if find_user
      redirect_to user_profile_path
    else
      @user = User.new
    end
  end

  def edit
    @user = User.find(session[:current_user_id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :storename, :email, :image_url))
      redirect_to user_profile_path
    else
      render :edit
    end
  end

  def create
    # raise params.inspect
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'The User is successfully saved!'
      session[:current_user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def user_category
    @user = User.find(params[:id])
    @user_products = Product.where(user_id: params[:id])
  end

  def profile
    if find_user
      @user_products = Product.where(user_id: (session[:current_user_id]))
    else
      redirect_to new_login_path, alert: "Please login to view your dashboard."
    end
  end

  def user_params
    params.require(:user).permit(:name, :storename, :email, :username, :password, :password_confirmation, :image_url)
  end

  def orderfulfillment
    if params[:sort]
      @orderfulfillment = ordfull.sort_by {|ord| ord.status}
    else
      @orderfulfillment = ordfull
    end
  end

  def total_revenue
    orderfulfillment.inject(0) {|sum, orderitem| sum += orderitem.total_price }
  end

  private

  def ordfull
    userproducts = User.find(session[:current_user_id]).products
    @orderfulfillment = userproducts.collect {|userproduct| Orderitem.all.where( product_id: userproduct.id) }.flatten.sort
  end

end
