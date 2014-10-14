class OrderitemsController < ApplicationController
  def destroy
    if @orderitem = find_orderitem
      @orderitem.destroy
    end
    redirect_to(edit_order_path)
  end

  def create #add product to cart
    #put code here
    #need to have catch for creating Order
  end

  def update #update products in cart
    params[:order].each do |key, value|
      orderitem = Orderitem.find(key)
      orderitem.update(value)

      #Trying to make this more secure... necessary?
      # orderitem.update(value.require(key).permit(:qty, :totalprice, :product_id, :order_id))

      new_total = orderitem.qty * orderitem.product.price
      orderitem.update(totalprice: new_total)
    end

    redirect_to(edit_order_path)
  end


  private

  def find_orderitem
    Orderitem.find_by(id: params[:id])
  end
end
