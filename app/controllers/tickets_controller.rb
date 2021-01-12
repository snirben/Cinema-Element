class TicketsController < ApplicationController

  def show
    @screen= Screen.find(params[:screen_id])
    @numberofseats = @screen.hall.seats
  end



  def create

  end
end
