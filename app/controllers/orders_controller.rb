class OrdersController < ApplicationController

  def index # view all orders; don't want people to see this
    redirect_to(root_path)
  end

  def new # checkout page
    find_cart
    @order = Order.new
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
    find_order
    if @order == nil
      redirect_to cart_path
    end
  end

  def cancel
    orditm = Orderitem.find(params[:format])
    orditm.order.update(status: "Cancel")
    redirect_to user_orderfulfillment_path
  end

  def ship
    orditm = Orderitem.find(params[:format])
    orditm.order.update(status: "Ship")
    redirect_to user_orderfulfillment_path
  end

  def info
    @buyer = Orderitem.find(params[:format]).order
  end


  private

  def find_order
    @order = Order.find_by(id: session[:order_id])
  end

  def find_cart
    @cart = Cart.find_by(id: session[:cart_id])
  end

  def save_order
    setup_order
    if @order.save
      post_order_save_tidying
      redirect_to show_order_path
    else
      render :new
    end
  end

  def setup_order
    @order = Order.new(params.require(:order).permit(:name_on_card, :card_number, :card_exp, :security_code, :address, :city, :state, :zip, :email))
    @order.total_price = @cart.total_price
    @order.status = "pending"
    @order.orderdate = DateTime.now
  end

  def post_order_save_tidying
    add_orderitems_to_order
    update_product_stocks
    cleanse_sessions
    @order.update!(status: "paid")
  end

  def add_orderitems_to_order
    @cart.orderitems.each do |item|
      item.update(order_id: @order.id)
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
