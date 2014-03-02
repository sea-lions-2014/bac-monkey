class AlcoholCalcController < ApplicationController
  respond_to :json, only: [:create]

  def create
    args = params[:alcohol_calc]
    save_consumption_record(args) if current_user
    
    args[:weight] = args[:weight].to_i
    args[:alcohol] = args[:drinks].to_i * 0.6
    args[:hours] = args[:hours].to_i

    @alcohol_calc = AlcoholCalc.new(args)
    @bac = @alcohol_calc.bac_series
    render json: @bac
  end

  def save_consumption_record
      current_user.consumption_records.build(substance: "alcohol", 
                                             amount: args[:drinks],
                                             unit_of_measure: "drink")
  end
end
