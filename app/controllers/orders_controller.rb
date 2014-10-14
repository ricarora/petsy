class OrdersController < ApplicationController

  def index #all orders; don't want people to be able to see this
    redirect_to(root_path)
  end

  def create #create an order object

  end

  def edit #individual order add products or update products
    #needs if statement for when order not created yet
    #display cart with all orderitems
  end

  def update

  end

  def checkout #this will post to update

  end

  def show #final individual order
    #display order, not editable with all orderitems
  end

  def destroy #this will be posted to from edit ("clear cart")

  end

end
