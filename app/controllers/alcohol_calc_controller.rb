class AlcoholCalcController < ApplicationController
  respond_to :json, only: [:create]


  def create
    args = format_params(params)
    save_consumption_record(args) if current_user
    @alcohol_calc = AlcoholCalc.new(args)
    @bac = @alcohol_calc.series
    render json: @bac
  end

  def save_consumption_record(args)
      current_user.consumption_records.create(substance: "alcohol",
                                             amount: args[:drinks],
                                             unit_of_measure: "drink")
  end

  def format_params(params)
    args = params[:alcohol_calc]
    args[:weight] = args[:weight].to_i
    args[:alcohol] = args[:drinks].to_i * 0.6
    args[:hours] = args[:hours].to_i
    args
  end
end