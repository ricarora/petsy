class OrderitemsController < ApplicationController
  def create #add product to cart
    if product_in_stock?
      if find_cart #if a cart has already been created...
        assemble_orderitem(@cart)
      else
        @cart = Cart.create
        session[:cart_id] = @cart.id #saves @cart.id to session
        session[:order_id] = nil #clears out old order_id
        assemble_orderitem(@cart)
      end
    else
      redirect_to cart_path, alert: "Sorry, product is out of stock."
    end
  end

  def update #update products in cart
    params[:cart].each do |key, value|
      orderitem = Orderitem.find(key)
      orderitem.qty = (value["qty"])
      orderitem.update(total_price: (orderitem.qty * orderitem.product.price))
    end
    update_cart_total
    redirect_to cart_path, notice: "Cart updated!"
  end

  def destroy
    if find_orderitem
      @orderitem.destroy
      update_cart_total
    end
    redirect_to cart_path, notice: "Product removed!"
  end

  def cancel
    orditm = Orderitem.find(params[:format])
    orditm.update(status: "Cancel")
    redirect_to user_orderfulfillment_path
  end

  def ship
    orditm = Orderitem.find(params[:format])
    orditm.update(status: "Ship")
    redirect_to user_orderfulfillment_path
  end

  # def sort_by_status
  #   orditm = Orderitem.find(params[:format])
  #   orditm.sort_by {|ord| ord.status}.reverse
  #   redirect_to user_orderfulfillment_path
  # end

  private

  def product_in_stock?
    @product = Product.find_by(id: params[:product_id])
    @product.stock > 0 ? true : false
  end

  def find_cart
    @cart = Cart.find_by(id: session[:cart_id])
  end

  def find_orderitem
    @orderitem = Orderitem.find_by(id: params[:id])
  end

  def assemble_orderitem(cart)
    product_id = params[:product_id]
    product = Product.find(product_id)

    if catch_for_duplicates(cart, product)
      duplicate_add(product, cart)
    else
      unique_add(product, cart)
    end
  end

  def catch_for_duplicates(cart, product)
    duplicate = false
    cart.orderitems.each { |item| duplicate = true if item.product_id == product.id }
    return duplicate
  end

  def duplicate_add(product, cart)
    item = Orderitem.where("product_id = #{product.id} AND cart_id = #{cart.id}").first

    item.qty += 1 if (item.qty < item.product.stock)
    item.total_price = (item.qty * item.product.price)

    if item.save
      update_cart_total
      redirect_to cart_path, notice: "Product updated!"
    else
      error_save_message
    end
  end

  def unique_add(product, cart)
    item = Orderitem.new(product_id: product.id, qty: 1, total_price: product.price, cart_id: cart.id)
    if item.save
      update_cart_total
      redirect_to cart_path, notice: "Product added to cart!"
    else
      error_save_message
    end
  end

  def update_cart_total
    find_cart
    total = @cart.orderitems.inject(0) { |sum, item| sum + item.total_price }
    @cart.total_price = total
    @cart.save
  end

  def error_save_message
    redirect_to cart_path, alert: "Something went wrong. :( Try again?"
  end
end
