class TicketsController < ApplicationController
  before_action :init_session, :release_seats
  def show
    @screen = Screen.find(params[:screen_id])
    @seats_taken = Seat.where(is_taken:true,screen_id: params[:screen_id])
    @numberofseats = @screen.hall.seats
  end

  def init_session
    if Order.find_by_id(session[:order_id]).nil?
      @order = Order.new
      @order.save
      session[:order_id] = @order.id
    else
      Order.find_by_id(session[:order_id])
    end
  end

  def release_seats
    @screen = Screen.find(params[:screen_id])
    if @screen.seat.present?
    @screen.seat.each do |seat|
      if seat.taken_at < (DateTime.now-10.minute) and seat.is_free
        seat.delete
      end
    end
    end

  end




  def create

  end
end
