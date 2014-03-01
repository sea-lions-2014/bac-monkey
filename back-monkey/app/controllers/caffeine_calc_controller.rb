class CaffeineCalcController < ApplicationController
  def create
    args = params[:caffeine_calc]
    args[:milligrams] = args[:milligrams].to_i
    args[:hours] = args[:hours].to_i

    @caffeine_series = CaffeineCalc.mg_series(args)

    render json: @caffeine_series
  end
end
