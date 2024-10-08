class UnitsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @units = Unit.all
  end

  def show
    @unit = Unit.find(params[:id])
    @rate = @unit.rate
  end

  def new
    @unit = Unit.new
    @unit.build_rate
  end

  def create
    @unit = Unit.new(unit_params)
    if @unit.save
      redirect_to @unit
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @unit = Unit.find(params[:id])
  end

  def update
    @unit = Unit.find(params[:id])
    if @unit.update(unit_params)
      redirect_to @unit
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy

    redirect_to units_path, status: :see_other
  end

  private
    def unit_params
      params.require(:unit).permit(:name, :description, rate_attributes: [:id, :dayrate, :weekrate, :monthrate, :_destroy])
    end
end
