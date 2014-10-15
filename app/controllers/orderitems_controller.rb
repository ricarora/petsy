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

    update_order_total
    redirect_to cart_path, notice: "Cart updated!"
  end

  def destroy
    if @orderitem = find_orderitem
      @orderitem.destroy
      update_order_total
    end
    redirect_to cart_path
  end


  private

  def find_orderitem
    Orderitem.find_by(id: params[:id])
  end

  def find_order
    @order = Order.find_by(id: session[:order_id])
  end

  def assemble_orderitem(order)
    product_id = params[:product_id]
    product = Product.find(product_id)

    if catch_for_duplicates(order, product)
      redirect_to cart_path, notice: "Something went wrong!" and return
    else
      product_price = product.price
      @item = Orderitem.new(product_id: product_id, qty: 1, totalprice: product_price, order_id: order.id)
      if @item.save
        update_order_total
        redirect_to cart_path
      else
        redirect_to :back, notice: "Something went wrong. :( Try again?"
      end
    end
  end

  def update_order_total
    find_order
    total = @order.orderitems.inject(0) { |sum, item| sum + item.totalprice }
    @order.total_price = total
    @order.save
  end

  def catch_for_duplicates(order, product)
    duplicate = false
    order.orderitems.each { |item| duplicate = true if item.product_id == product.id }
    return duplicate
  end
end
