class CaffeineCalcController < ApplicationController
  respond_to :json, only: [:create]

  def create
    args = params[:caffeine_calc]
    args[:hours] = args[:hours].to_i

    args[:milligrams] = MgOfCaffeine.caffeine_content(args[:type], args[:cups].to_i)
    caffeine_calc = CaffeineCalc.new(args)
    @caffeine_series = caffeine_calc.mg_series

    render json: @caffeine_series
  end
end
