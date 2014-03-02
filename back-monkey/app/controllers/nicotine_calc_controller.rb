class NicotineCalcController < ApplicationController
  respond_to :json, only: [:create]

  def create
    args = format_params(params)
    save_consumption_record(args) if current_user
    nicotine_calc = NicotineCalc.new(args)
    @nicotine_series = nicotine_calc.mg_series
    render json: @nicotine_series
  end

  def save_consumption_record(args)
      current_user.consumption_records.create(substance: "nicotine", 
                                             amount: args[:milligrams],
                                             unit_of_measure: "mg")
  end

  def format_params(params)
    args = params[:nicotine_calc]
    args[:hours] = args[:hours].to_i
    args[:milligrams] = args[:cigarettes].to_i
    args
  end
end
