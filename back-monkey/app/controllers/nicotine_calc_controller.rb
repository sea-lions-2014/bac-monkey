class NicotineCalcController < ApplicationController
  respond_to :json, only: [:create]

  def create
    args = params[:nicotine_calc]
    args[:hours] = args[:hours].to_i
    args[:milligrams] = args[:cigarettes].to_i

    nicotine_calc = NicotineCalc.new(args)
    @nicotine_series = nicotine_calc.mg_series

    render json: @nicotine_series
  end

end
