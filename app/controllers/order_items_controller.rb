class OrderItemsController < ApplicationController

  include ApplicationHelper
  before_action :set_order

  def create
    @order=current_order
    a=OrderItem.new(order_params)
    a.save
    @order.save
    session[:order_id]= @order.id
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
    params.require(:order_item).permit(:seat_id,:order_id)
  end

  def set_order

    @order = current_order
  end
end
