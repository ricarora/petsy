class OrdersController < ApplicationController

  def index #view all orders; don't want people to see this
    redirect_to(root_path)
  end

  def create #create an order & save the order_id to guest's session
    @order = Order.new(status: "Pending")
    session[:order_id] = @order.id
  end

  def edit #view cart
    if session[:order_id]
      #display cart with all orderitems
    else
      @empty_cart = "Your cart is empty!"
    end
  end

  def update #add/update products here
    if session[:order_id]
      #add orderitems to order
    else
      create #create order
      #add orderitems to order
    end
  end

  def checkout #this will post to update

  end

  def show #final individual order
    #display order, not editable with all orderitems
  end

  def destroy #this will be posted to from edit ("clear cart")

  end

end
