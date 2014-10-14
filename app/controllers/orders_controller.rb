class OrdersController < ApplicationController

  ## Debug toggle. Set to false to hide debug helpers
  DEBUG = true

  def index #view all orders; don't want people to see this
    redirect_to(root_path)
  end

  def create #create an order
    @order = Order.create(status: "Pending") #creates order with pending status
    session[:order_id] = @order.id #saves @order.id to session
  end

  def edit #view cart
    find_order ? find_order : create #this returns @order, finding or creating the order
    @line_items = @order.orderitems #this finds the associated orderitems

    if @line_items.size < 1 #this displays if there are no associated orderitems
      @empty_cart = "Your cart is empty!"
    end
  end

  def clear
    reset_session #just for testing...
  end

  # def checkout #this will put Order to update
  #
  # end
  #
  # def show #final individual order
  #   #display order, not editable with all orderitems
  # end
  #
  # def destroy #clear cart
  #
  # end


  private

  def find_order
    @order = Order.find_by(id: session[:order_id])
  end

end
