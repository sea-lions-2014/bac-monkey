class AlcoholCalcController < ApplicationController
  respond_to :json, only: [:create]
  def create
    args = {weight: params[:weight].to_i, gender: params[:gender], hours: params[:hours].to_i, alcohol: params[:alcohol].to_i}
    @bac = AlcoholCalc.bac_series(args)
    render json: @bac
  end
end
