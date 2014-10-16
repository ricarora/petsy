class OrdersController < ApplicationController

  def index #view all orders; don't want people to see this
    redirect_to(root_path)
  end

  # def checkout #this needs to take the cart and turn it into an order, saved as pending
  #
  # end

  # def finalize #this is posted to and needs to change the order status to paid
  #
  # end

  def show # individual order
    if find_order && @order.status != "Pending" #only display if not pending
      @line_items = @order.orderitems
    else
      redirect_to(cart_path)
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
end
