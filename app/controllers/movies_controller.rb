class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: 'Movie was successfully created.'
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.old_price = @movie.price
    if @movie.update(movie_params)
      redirect_to @movie, notice: 'Movie was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  private
  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :movie_length,
                                         :age_limit, :price, :image,
                                         :user_id, :age_limit , :old_price, :category,:blob)
    end
end
