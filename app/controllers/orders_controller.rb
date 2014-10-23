class OrdersController < ApplicationController

  def index # view all orders; don't want people to see this
    if find_user
      @myorders = @user.orders
    else
      redirect_to new_login_path, alert: "Please log in to view your orders."
    end
  end

  def new # checkout page
    find_user
    find_cart

    if @user
      @order = Order.new(user_id: @user.id, name_on_card: @user.name, email: @user.email)
    else
      @order = Order.new
    end

    if @cart == nil
      error_message
    end
  end

  def create # create order when paid
    if find_cart
      save_order
    else
      error_message
    end
  end

  def show # individual order
    find_order_dashboard
    if @order == nil
      redirect_to orders_path
    end
  end

  def confirmation # order confirmation show
    find_order
    if @order == nil
      redirect_to cart_path
    end
  end

  def info
    @order = Order.find(params[:id])
    @buyer_items = @order.orderitems.collect { |item| item if item.product.user_id == 5 }.compact

    if find_user && find_orderitems
      @buyer = @order
      @buyer_items = @order.orderitems.collect { |item| item if item.product.user_id == 5 }.compact
    else
      redirect_to root_path
    end
  end


  private

  def find_order
    @order = Order.find_by(id: session[:order_id])
  end

  def find_order_dashboard
    @order = Order.find_by(id: params[:id])
    if find_user
      @user_id = @user.id
    else
      @user_id = "foo"
    end

    if @order.user_id != @user_id
      @order = nil
    end
  end

  def find_orderitems
    orderitems = @order.orderitems
    among_sellers = false
    orderitems.each { |orderitem| among_sellers = true if orderitem.product.user_id == @user.id }
    return among_sellers
  end

  def save_order
    setup_order
    if @order.save
      post_order_save_tidying
      redirect_to order_confirmation_path
    else
      find_user
      render :new
    end
  end

  def setup_order
    @order = Order.new(params.require(:order).permit(:user_id, :name_on_card, :card_number, :card_exp, :security_code, :address, :city, :state, :zip, :email))
    @order.total_price = @cart.total_price
    @order.status = "Pending"
    @order.orderdate = DateTime.now
  end

  def post_order_save_tidying
    add_orderitems_to_order
    update_product_stocks
    cleanse_sessions
    @order.update!(status: "Paid")
  end

  def add_orderitems_to_order
    @cart.orderitems.each do |item|
      item.update(order_id: @order.id, status: "Pending")
    end
  end

  def update_product_stocks
    @order.orderitems.each do |item|
      product = Product.find(item.product_id)
      current_stock = product.stock
      product.update(stock: (current_stock - item.qty))
    end
  end

  def cleanse_sessions
    session[:order_id] = @order.id
    session[:cart_id] = nil
  end

  def error_message
    redirect_to cart_path, alert: "Something went wrong, try again! :("
  end
end
