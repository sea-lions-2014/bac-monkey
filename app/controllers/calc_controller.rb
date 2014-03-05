class CalcController < ApplicationController
  before_filter :format_params
  respond_to :json, only: [:create]

  def create
    @unit = "mg"
    save_consumption_record if save?
  end

  def save?
    current_user && @args[:save]
  end

  def save_consumption_record
      current_user.consumption_records.create(substance: @substance,
                                              amount: @args[:milligrams],
                                              unit_of_measure: @unit)
  end

  def format_params
    @args[:save] = eval(params[:save_search]) if params[:save_search]
    @args[:hours] = @args[:hours].to_i
    @args[:milligrams] = @args[:cigarettes].to_i
  end

end