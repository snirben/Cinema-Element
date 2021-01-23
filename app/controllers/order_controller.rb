class OrderController < ApplicationController

  before_action :set_total

  def see_cart
    @order=Order.find(session[:order_id])
    @order_items=@order.order_items
  end

  def checkout
    if params[:commit]=="Buy"
      redirect_to thankyou_path
    end

    @order = Order.find(params[:id])
    @total= 0
    @order_items=Order.find(session[:order_id]).order_items
    @order_items.each do |item|
      @total+= item.seat.screen.movie.price
    end

  end
  def thankyou
    redirect_to order_thankyou_path

  end


  def set_total
     @total= 0
     @order_items=Order.find(session[:order_id]).order_items
     @order_items.each do |item|
      @total+= item.seat.screen.movie.price
   end
  end

end