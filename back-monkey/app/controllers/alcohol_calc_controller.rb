class AlcoholCalcController < ApplicationController
  respond_to :json, only: [:create]
  def create
    args = params[:alcohol_calc]
    args[:weight] = args[:weight].to_i
    args[:alcohol] = args[:drinks].to_i * 0.6
    args[:hours] = args[:hours].to_i

    @bac = AlcoholCalc.bac_series(args)
    render json: @bac
  end
end
