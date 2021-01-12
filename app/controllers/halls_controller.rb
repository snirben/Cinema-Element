class HallsController < ApplicationController
  def index
    @halls = Hall.all
  end

  def show
    @hall = Hall.find(params[:id])
  end

  def new
    @hall = Hall.new
  end

  def edit
    @hall = Hall.find(params[:id])
  end

  def create
    @hall = Hall.new(hall_params)
    if @hall.save
      redirect_to @hall, notice: 'Hall was successfully created.'
    else
      render :new
    end
  end

  def update
    @hall = Hall.find(params[:id])
    if @hall.update(hall_params)
      redirect_to @hall, notice: 'hall was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @hall = Hall.find(params[:id])
    @hall.destroy
    redirect_to halls_path
  end

  private

  def hall_params
    params.require(:hall).permit(:title, :hall_num, :floor,
                                 :seats )
  end
end
