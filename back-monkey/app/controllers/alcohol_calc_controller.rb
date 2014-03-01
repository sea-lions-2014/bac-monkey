class AlcoholCalcController < ApplicationController
  respond_to :json, only: [:create]
  before_filter :format_args_data

  def create
    alcohol_calc = AlcoholCalc.new
    @bac = alcohol_calc.bac_series(args)
    render json: @bac
  end

  protected

  def format_args_data
    args = params[:alcohol_calc]
    p params

    args[:weight] = args[:weight].to_i
    args[:alcohol] = args[:drinks].to_i * 0.6
    args[:hours] = args[:hours].to_i

    alcohol_calc = AlcoholCalc.new
    @bac = alcohol_calc.bac_series(args)
    render json: @bac
  end
end
