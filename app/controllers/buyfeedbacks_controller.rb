class BuyfeedbacksController < ApplicationController
  before_action :set_buyfeedback, only: [:show, :edit, :update, :destroy]

  # GET /buyfeedbacks
  # GET /buyfeedbacks.json
  def index
    @buyfeedbacks = Buyfeedback.all
  end

  # GET /buyfeedbacks/1
  # GET /buyfeedbacks/1.json
  def show
  end

  # GET /buyfeedbacks/new
  def new
    @buyfeedback = Buyfeedback.new
  end

  # GET /buyfeedbacks/1/edit
  def edit
  end

  # POST /buyfeedbacks
  # POST /buyfeedbacks.json
  def create
    @buyfeedback = Buyfeedback.new(buyfeedback_params)

    respond_to do |format|
      if @buyfeedback.save
        format.html { redirect_to @buyfeedback, notice: 'Buyfeedback was successfully created.' }
        format.json { render :show, status: :created, location: @buyfeedback }
      else
        format.html { render :new }
        format.json { render json: @buyfeedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buyfeedbacks/1
  # PATCH/PUT /buyfeedbacks/1.json
  def update
    respond_to do |format|
      if @buyfeedback.update(buyfeedback_params)
        format.html { redirect_to @buyfeedback, notice: 'Buyfeedback was successfully updated.' }
        format.json { render :show, status: :ok, location: @buyfeedback }
      else
        format.html { render :edit }
        format.json { render json: @buyfeedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buyfeedbacks/1
  # DELETE /buyfeedbacks/1.json
  def destroy
    @buyfeedback.destroy
    respond_to do |format|
      format.html { redirect_to buyfeedbacks_url, notice: 'Buyfeedback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buyfeedback
      @buyfeedback = Buyfeedback.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def buyfeedback_params
      params.fetch(:buyfeedback, {}).permit(:name,:message)
    end
end
