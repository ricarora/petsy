class OrderitemsController < ApplicationController
  def create #add product to cart
    if find_order #if an order has already been created...
      assemble_orderitem(@order)
    else
      @order = Order.create(status: "Pending") #creates order with pending status
      session[:order_id] = @order.id #saves @order.id to session
      assemble_orderitem(@order)
    end
  end

  def update #update products in cart
    params[:order].each do |key, value|
      orderitem = Orderitem.find(key)
      orderitem.qty = (value["qty"])
      orderitem.update(totalprice: (orderitem.qty * orderitem.product.price))
    end

    redirect_to cart_path, notice: "Cart updated!"
  end

  def destroy
    if @orderitem = find_orderitem
      @orderitem.destroy
    end
    redirect_to(cart_path)
  end


  private

  def find_orderitem
    Orderitem.find_by(id: params[:id])
  end

  def find_order
    @order = Order.find_by(id: session[:order_id])
  end

  def assemble_orderitem(order)
    @item = Orderitem.new(params[:product_id])#params.require(:purchase).permit(:product_id)) # assumes add to cart is a post request to /orderitems/new with purchase[product_id]
    @item.order_id = order.id
    if @item.save
      redirect_to cart_path
    else
      redirect_to :back, notice: "Something went wrong. :( Try again?"
    end
  end
end
