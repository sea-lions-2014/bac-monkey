class CaffeineCalcController < ApplicationController
  respond_to :json, only: [:create]
  before_filter :convert_cups_to_caffeine_mg

  def create
    args = params[:caffeine_calc]
    args[:hours] = args[:hours].to_i

    caffeine_calc = CaffeineCalc.new
    @caffeine_series = caffeine_calc.mg_series(args)

    render json: @caffeine_series
  end

  protected

  def convert_cups_to_caffeine_mg
    args = params[:caffeine_calc]
    args[:milligrams] = MgOfCaffeine.caffeine_content(args[:type], args[:cups])
  end
end
