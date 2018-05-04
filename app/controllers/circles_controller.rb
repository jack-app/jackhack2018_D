class CirclesController < ApplicationController
  before_action :set_circle, only: [:show, :edit, :update, :destroy]

  # GET /circles
  # GET /circles.json
  def index
    @circles = Circle.all
  end

  # GET /circles/1
  # GET /circles/1.json
  def show
  end

  # GET /circles/new
  def new
    @circle = Circle.new
  end

  # GET /circles/1/edit
  def edit
  end

  # POST /circles
  # POST /circles.json
  def create
    @circle = Circle.new(circle_params)
    if @circle.save
      redirect_to @circle, notice: 'Circle was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /circles/1
  # PATCH/PUT /circles/1.json
  def update
    if @circle.update(circle_params)
      redirect_to @circle, notice: 'Circle was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /circles/1
  # DELETE /circles/1.json
  def destroy
    @circle.destroy
    redirect_to circles_url, notice: 'Circle was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circle
      @circle = Circle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def circle_params
      params.require(:circle).permit(:name, :profile, :intercollege, :cost)
    end
end
