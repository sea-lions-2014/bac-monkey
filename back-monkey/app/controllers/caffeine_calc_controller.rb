class CaffeineCalcController < ApplicationController
  def create
    args = params[:caffeine_calc]
    args[:hours] = args[:hours].to_i

    args[:milligrams] = MgOfCaffeine.caffeine_content(args[:type], args[:cups].to_i)
    @caffeine_series = CaffeineCalc.mg_series(args)

    render json: @caffeine_series
  end
end
