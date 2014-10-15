class OrdersController < ApplicationController

  def index #view all orders; don't want people to see this
    redirect_to(root_path)
  end

  # def checkout #this will put Order to update
  #
  # end

  def show # individual order
    if find_order && @order.status != "Pending" #only display if not pending
      @line_items = @order.orderitems
    else
      redirect_to(cart_path)
    end
  end


  #############################################################################
  # Kristina's Methods for Testing!!                                          #
  #############################################################################
  def clear #just for testing...
    reset_session
    redirect_to root_path
  end

  def set_order_session #just for testing...
    session[:order_id] = Order.all.last.id
    redirect_to root_path
  end
  #############################################################################


  private

  def find_order
    @order = Order.find_by(id: session[:order_id])
  end

  def find_items
    @line_items = @order.orderitems
  end

  def empty_cart
    @empty_cart = "Your cart is empty!"
  end

  def empty_cart_catch(line_items)
    if line_items.size < 1
      empty_cart
    end
  end

end
