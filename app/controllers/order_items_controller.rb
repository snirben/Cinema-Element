class OrderItemsController < ApplicationController

  include ApplicationHelper
  before_action :set_order

  def create
  end

  def add_to_cart
    @order=current_order
    if Seat.where(seat_num:params[:seat_num],screen_id:params[:screen_id],is_taken:false).count == 0
      @seat=Seat.new(seat_num:params[:seat_num], screen_id:params[:screen_id], is_taken:true,
                     hall_id: Screen.find(params[:screen_id]).hall_id , taken_at: DateTime.now)
      @seat.save
    else
      redirect_to tickets_path
    end
    @order_item=OrderItem.new(order_id: @order.id,
                              seat_id: @seat.id,
                              unit_price: Movie.find(params[:movie_id]).price)
    @order_item.save
    redirect_to tickets_path
  end

  def remove_from_cart
    @order_item=OrderItem.find(params[:id])
    @order_item.seat.delete
    @order_item.delete
    redirect_to order_cart_path(session[:order_id])
  end

  def update
    @order=current_order.find(params[:id])
    @order_item.update_attributes(order_params)
    @order_items=current_order.order_items
  end

  def destroy
    @order_item=@order.order_items.find(params[:D])
    @order_item.destory
    @order_items = current_order.order_items
  end


  private
  def order_params
    params.permit(:seat_id,:order_id)
  end

  def set_order

    @order = current_order
  end
end
