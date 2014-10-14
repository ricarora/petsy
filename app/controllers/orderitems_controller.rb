class OrderitemsController < ApplicationController
  def destroy
    if @orderitem = find_orderitem
      @orderitem.destroy
    end
    redirect_to(edit_order_path)
  end


  private

  def find_orderitem
    @orderitem = Orderitem.find_by(id: params[:id])
  end
end
