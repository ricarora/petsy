class OrdersController < ApplicationController

  ## Debug toggle. Set to false to hide debug helpers
  DEBUG = true

  def index #view all orders; don't want people to see this
    redirect_to(root_path)
  end

  def edit #view cart
    if find_order #this returns @order
      @line_items = @order.orderitems #this finds the associated orderitems
      empty_cart_catch(@line_items) #if no orderitems, empty cart message displays
    else
      empty_cart #this displays if there are no associated orderitems
    end
  end

  # def checkout #this will put Order to update
  #
  # end
  #
  # def show #final individual order
  #   #display order, not editable with all orderitems
  # end

  def destroy #clear cart
    if @order = find_order
      @order.destroy
    end
    redirect_to(cart_path)
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

  def empty_cart
    @empty_cart = "Your cart is empty!"
  end

  def empty_cart_catch(line_items)
    if line_items.size < 1
      empty_cart
    end
  end

end
