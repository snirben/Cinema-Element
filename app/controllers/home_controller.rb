class HomeController < ApplicationController
  before_action :init_session
  def index
    if params[:customdate].present?
      session[:master_date]=Time.parse(params[:customdate].to_s)
      @start_date = Time.parse(params[:customdate])
      if @start_date >= Time.parse(Date.today.to_s)
      @movies = Movie.joins(:screens).where('screens.screen_at > ?',@start_date.beginning_of_day).distinct
      @movies = @movies.joins(:screens).where('screens.screen_at < ?',@start_date.end_of_day).distinct
      return @movies
      else
        @movies=Movie.where(price:2423423424424232)
        return @movies
      end
    end
    if params[:button]

      session[:master_date]=Time.parse(params[:button].to_s)
      @start_date = Time.parse(params[:button])
      @movies = Movie.joins(:screens).where('screens.screen_at > ?',@start_date.beginning_of_day).distinct
      @movies = @movies.joins(:screens).where('screens.screen_at < ?',@start_date.end_of_day).distinct
      return @movies
    end
    if params[:commit] == "ONSALE"
      @start_date =session[:master_date].to_datetime
      @movies = Movie.joins(:screens).where('screens.screen_at > ?',@start_date.beginning_of_day).distinct
      @movies = @movies.joins(:screens).where('screens.screen_at < ?',@start_date.end_of_day).distinct
      @movies = @movies.all.where('price - old_price <0')
      return @movies
    end
    if params[:order] == "inc"
      @start_date =session[:master_date].to_datetime
      @movies = Movie.joins(:screens).where('screens.screen_at > ?',@start_date.beginning_of_day).distinct
      @movies = @movies.joins(:screens).where('screens.screen_at < ?',@start_date.end_of_day).distinct
      @movies = @movies.all.order(price: :desc)
      return @movies
    elsif params[:order] =="dec"
      @start_date =session[:master_date].to_datetime
      @movies = Movie.joins(:screens).where('screens.screen_at > ?',@start_date.beginning_of_day).distinct
      @movies = @movies.joins(:screens).where('screens.screen_at < ?',@start_date.end_of_day).distinct
      @movies = @movies.order(price: :asc)
      return @movies
    elsif params[:order] =="pop"
      @start_date =session[:master_date].to_datetime
      @movies = Movie.joins(:screens).where('screens.screen_at > ?',@start_date.beginning_of_day).distinct
      @movies = @movies.joins(:screens).where('screens.screen_at < ?',@start_date.end_of_day).distinct
      @movies = @movies.order(booked_counter: :desc)
      return @movies
    elsif params[:cat].present?
      @start_date =session[:master_date].to_datetime
      @movies = Movie.joins(:screens).where('screens.screen_at > ?',@start_date.beginning_of_day).distinct
      @movies = @movies.joins(:screens).where('screens.screen_at < ?',@start_date.end_of_day).distinct
      @movies = @movies.where(category: params[:cat])
      return @movies
    elsif params[:commit] == "Find Me Movies"

      @movies = Movie.all

      if params[:category]
        @movies = @movies.where(category_id:params[:category])
      end

      if params[:date].present?
        session[:master_date]=Time.parse(params[:date])
        @start_date = Time.parse(params[:date])
        @movies = @movies.joins(:screens).where('screens.screen_at > ?',@start_date.beginning_of_day).distinct
        @movies = @movies.joins(:screens).where('screens.screen_at < ?',@start_date.end_of_day).distinct
      end

      if params[:from] and params[:to]
        @movies = @movies.where('price >= ?':params[:from].to_i)
        @movies = @movies.where('price <= ?':params[:to].to_i)
      end
      return @movies
    else
      session[:master_date]=Time.parse(Date.today.to_s)
      @movies=Movie.all
      @start_date=Time.parse(Date.today.to_s)
      @movies = @movies.joins(:screens).where('screens.screen_at > ?',@start_date.beginning_of_day).distinct
      @movies = @movies.joins(:screens).where('screens.screen_at < ?',@start_date.end_of_day).distinct
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

end
