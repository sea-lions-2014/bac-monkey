class CaffeineCalcController < ApplicationController
  before_filter :format_params
  respond_to :json, only: [:create]

  def create
    save_consumption_record if current_user && @args[:save]
    @caffeine_series = CaffeineCalc.new(@args).series
    render json: @caffeine_series
  end

  def save_consumption_record
      current_user.consumption_records.create(substance: "caffeine", amount: @args[:milligrams], unit_of_measure: "mg")
  end

  def format_params
    @args = params[:caffeine_calc]
    @args[:save] = eval(params[:save_search]) if params[:save_search]
    @args[:hours] = @args[:hours].to_i
    @args[:milligrams] = MgOfCaffeine.caffeine_content(@args[:type], @args[:cups].to_i)
    @args
  end
end
