class ScreensController < ApplicationController
  skip_forgery_protection
  def new
    @screen = Screen.new
  end

  def edit
    @screen = Screen.find(params[:screen_id])
  end

  def create
    @screen = Screen.new(movie_id:params[:screen][:movie_id],
                         screen_at: params[:screen][:screen_at],
                         hall_id: params[:screen][:hall_id])
    if @screen.save
      redirect_to @screen, notice: 'Screen was successfully created.'
    else
      render :new
    end
  end

  def update
    @screen = Screen.find(params[:screen][:screen_id])
    if @screen.update(movie_id:params[:screen][:movie_id],
                      screen_at: params[:screen][:screen_at],
                      hall_id: params[:screen][:hall_id])
      redirect_to movie_path(movie_id:@screen.movie.id), notice: 'Screen was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @screen = Screen.find(params[:screen_id])
    @seats = Seat.where(screen_id:params[:screen_id]).destroy_all
    @screen.destroy
    redirect_to movies_path
  end

  private


  def screen_params
    params.permit(:movie_id, :screen_at, :hall_id)
  end


end
