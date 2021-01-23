class BuyController < ApplicationController

  def buy
    @random= rand(2) == 1
    if @random
      @order = Order.find(params[:order_id])
      @order.update(status:"Done")
      @order.order_items.each do |item|
        item.seat.update(is_free: false)
        item.seat.screen.movie.update(booked_counter:item.seat.screen.movie.booked_counter+1)

      end
      session[:order_id] = nil
      init_session
    else

    end
  end
  end

def init_session
  if Order.find_by_id(session[:order_id]).nil?
    @order = Order.new
    @order.status = "ongoing"
    @order.save
    session[:order_id] = @order.id
  else
    Order.find_by_id(session[:order_id])
  end
end