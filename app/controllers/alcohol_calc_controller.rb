class AlcoholCalcController < ApplicationController
  before_filter :format_params
  respond_to :json, only: [:create]

  def create
    save_consumption_record if current_user && @args[:save]
    @bac = AlcoholCalc.new(@args).series
    render json: @bac
  end

  def save_consumption_record
      current_user.consumption_records.create(substance: "alcohol",
                                             amount: @args[:drinks],
                                             unit_of_measure: "drink")
  end

  def format_params
    @args = params[:alcohol_calc]
    @args[:save] = eval(params[:save_search]) if params[:save_search]
    @args[:weight] = @args[:weight].to_i
    @args[:alcohol] = @args[:drinks].to_i * 0.6
    @args[:hours] = @args[:hours].to_i
    @args
  end
end