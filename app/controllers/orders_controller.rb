class OrdersController < ApplicationController

  def index #view all orders; don't want people to see this
    redirect_to(root_path)
  end

  def create
    if find_cart
      @items = @cart.orderitems
      @order = Order.new(total_price: @cart.total, status: :pending)

      if @order.save
        add_orderitems_to_order
        sessions_switch
        redirect_to checkout_path
      else
        error_save_message
      end
    else
      error_save_message
    end
  end

  def edit
    find_order
  end

  # def finalize #this is posted to and needs to change the order status to paid
  #
  # end

  def show # individual order
    if find_order && @order.status != :pending #only display if not pending
      @line_items = @order.orderitems
    else
      redirect_to cart_path
    end
  end


###############################################################################
### Kristina's Method for Testing!!                                           #
###############################################################################
  def clear #just for testing...
    reset_session
    redirect_to root_path
  end
###############################################################################


  private

  def find_order
    @order = Order.find_by(id: session[:order_id])
  end

  def find_cart
    @cart = Cart.find_by(id: session[:cart_id])
  end

  def sessions_switch
    session[:order_id] = @order.id
    session[:cart_id] = nil
  end

  def add_orderitems_to_order
    @items.each do |item|
      item.cart_id = nil
      item.order_id = @order.id
      item.save
    end
  end

  def error_save_message
    redirect_to cart_path, notice: "Something went wrong! :("
  end
end
