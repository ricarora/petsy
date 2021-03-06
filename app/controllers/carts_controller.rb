class CartsController < ApplicationController

  def edit #view cart
    if find_cart #this returns @cart
      find_user
      @line_items = @cart.orderitems.sort_by { |a| a.created_at } #this finds the associated orderitems
      empty_cart_catch(@line_items) #if no orderitems, empty cart message displays
    else
      empty_cart #this displays if there are no associated orderitems
    end
  end

  def destroy #clear cart
    if find_cart
      @cart.destroy
      session[:cart_id] = nil
    end
    redirect_to cart_path
  end


  private

  def empty_cart
    @empty_cart = "Your cart is empty!"
  end

  def empty_cart_catch(line_items)
    if line_items.size < 1
      empty_cart
    end
  end

end
