class NicotineCalcController < ApplicationController
  respond_to :json, only: [:create]
  before_filter :format_params

  def create
    save_consumption_record if current_user
    @nicotine_series = NicotineCalc.new(@args).mg_series
    render json: @nicotine_series
  end

  def save_consumption_record
      current_user.consumption_records.create(substance: "nicotine",
                                             amount: @args[:milligrams],
                                             unit_of_measure: "mg")
  end

  def format_params
    @args = params[:nicotine_calc]
    @args[:hours] = @args[:hours].to_i
    @args[:milligrams] = @args[:cigarettes].to_i
    @args
  end
end
