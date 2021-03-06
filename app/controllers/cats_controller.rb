class CatsController < ApplicationController
  before_action :set_cat, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :create, :update, :destroy]
  EXCEPT_PARAMS = [:created_at, :updated_at, :color_id, :breed_id]
  INCLUDE_EXCEPT_PARAMS = [:created_at, :updated_at]

  # GET /cats
  def index
    @cats = Cat.all.includes(:color, :breed)
    render json: @cats, :include => {:color => {except: INCLUDE_EXCEPT_PARAMS}, :breed => {except: INCLUDE_EXCEPT_PARAMS}}, except: EXCEPT_PARAMS
  end

  # GET /cats/1
  def show
    render json: @cat, :include => {:color => {except: INCLUDE_EXCEPT_PARAMS}, :breed => {except: INCLUDE_EXCEPT_PARAMS}}, except: EXCEPT_PARAMS
  end

  # POST /cats
  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      render json: @cat, status: :created, location: @cat
    else
      render json: @cat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cats/1
  def update
    if @cat.update(cat_params)
      render json: @cat
    else
      render json: @cat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cats/1
  def destroy
    @cat.destroy
  end

  private


  # Use callbacks to share common setup or constraints between actions.
  def set_cat
    @cat = Cat.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def cat_params
    params.require(:cat).permit(:name, :age, :color_id, :breed_id)
  end
end