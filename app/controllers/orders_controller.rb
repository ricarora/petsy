class OrdersController < ApplicationController

  def index # view all orders; don't want people to see this
    redirect_to(root_path)
  end

  def create # checkout
    if find_cart
      @items = @cart.orderitems
      @order = Order.new(total_price: @cart.total_price, status: "pending")
      save_order
    else
      error_save_message
    end
  end

  def edit
    find_order
  end

  def update # finish and pay
    find_order
    @order.update(params.require(:edit_order).permit(:name_on_card, :card_number, :card_exp, :security_code, :address, :city, :state, :zip, :email))
    @order.update(status: "paid", orderdate: DateTime.now)
    update_product_stocks
    session[:cart_id] = nil #clears cart on @order.update
    redirect_to show_order_path
  end

  def show # individual order
    if find_order && @order.status != "pending"
      @line_items = @order.orderitems
    else
      redirect_to cart_path
    end
  end


  private

  def find_order
    @order = Order.find_by(id: session[:order_id])
  end

  def find_cart
    @cart = Cart.find_by(id: session[:cart_id])
  end

  def save_order
    if @order.save
      add_orderitems_to_order
      session[:order_id] = @order.id
      redirect_to edit_order_path
    else
      error_save_message
    end
  end

  def add_orderitems_to_order
    @items.each do |item|
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

  def error_save_message
    redirect_to cart_path, alert: "Something went wrong! :("
  end
end
