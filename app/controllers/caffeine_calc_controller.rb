class CaffeineCalcController < ApplicationController
  respond_to :json, only: [:create]

  def create
    args = format_params(params)
    save_consumption_record(args) if current_user && args[:save]
    caffeine_calc = CaffeineCalc.new(args)
    @caffeine_series = caffeine_calc.series
    render json: @caffeine_series
  end

  def save_consumption_record(args)
      current_user.consumption_records.create(substance: "caffeine",
                                             amount: args[:milligrams],
                                             unit_of_measure: "mg")
  end

  def format_params(params)
    args = params[:caffeine_calc]
    args[:save] = eval(params[:save_search]) if params[:save_search]
    args[:hours] = args[:hours].to_i
    args[:milligrams] = MgOfCaffeine.caffeine_content(args[:type], args[:cups].to_i)
    args
  end
end
