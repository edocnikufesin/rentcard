class RatesController < ApplicationController
  before_action :set_unit
  def create
    @rate = @unit.build_rate(rate_params)

    if @rate.save
      redirect_to unit_path(@unit), notice: "Rate was sucessfully created."
    else
      render "new", status: :unprocessable_entity
    end
  end
  def update
    @rate = @unit.rate
    if @rate.update(rate_params)
      redirect_to unit_path(@unit), notice: "Rate was successfully updated."
    else
      render "edit", status: :unprocessable_entity
    end
  end

  private

  def set_unit
    @unit = Unit.find(params[:unit_id])
  end

  def rate_params
    params.require(:rate).permit(:dayrate, :weekrate, :monthrate)
  end
end
