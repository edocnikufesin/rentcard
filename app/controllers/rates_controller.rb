class RatesController < ApplicationController
  def create
    @unit = Unit.find(params[:unit_id])
    @rate = @unit.rates.create(rate_params)
    redirect_to unit_path(@unit)
  end

  private
    def rate_params
      params.require(:rate).permit(:dayrate, :weekrate, :monthrate)
    end
end
