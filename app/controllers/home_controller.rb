class HomeController < ApplicationController
  before_action :init_session
  def index
    if params[:customdate].present?
      @start_date = Time.parse(params[:customdate])
      @movies = Movie.joins(:screens).where('screens.screen_at > ?',@start_date.beginning_of_day).distinct
      @movies = @movies.joins(:screens).where('screens.screen_at < ?',@start_date.end_of_day).distinct
      return @movies
    end
    if params[:button]
      @start_date = Time.parse(params[:button])
      @movies = Movie.joins(:screens).where('screens.screen_at > ?',@start_date.beginning_of_day).distinct
      @movies = @movies.joins(:screens).where('screens.screen_at < ?',@start_date.end_of_day).distinct
      return @movies
    end
    if params[:commit] == "ONSALE"
      @movies = Movie.all.where(:price < :old_price)
      puts "im here"
    end
    if params[:order] == "inc"
      @movies = Movie.all.order(price: :desc)
    elsif params[:order] =="dec"
      @movies = Movie.all.order(price: :asc)
    elsif params[:order] =="pop"
      @movies = Movie.all.order(booked_counter: :desc)
    elsif params[:commit] == "Find Me Movies"
      if params[:category]
        @movies = Movie.all
        @movies = @movies.where(category_id:params[:category])
      end
      if params[:date]
        @movies = Movie.all
        @start_date = Time.parse(params[:date])
        @movies = @movies.joins(:screens).where('screens.screen_at > ?',@start_date.beginning_of_day).distinct
        @movies = @movies.joins(:screens).where('screens.screen_at < ?',@start_date.end_of_day).distinct
      end
      if params[:from] and params[:to]
        @movies = Movie.all
        @movies = @movies.where('price >=':params[:from].to_i)
        @movies = @movies.where('price <=':params[:to].to_i)
      end
    else
      @movies=Movie.all
      @start_date=Time.parse(Date.today.to_s)
      @movies = @movies.joins(:screens).where('screens.screen_at > ?',@start_date.beginning_of_day).distinct
      @movies = @movies.joins(:screens).where('screens.screen_at < ?',@start_date.end_of_day).distinct
    end


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

end
