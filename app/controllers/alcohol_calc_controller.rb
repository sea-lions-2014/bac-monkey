class AlcoholCalcController < CalcController
  before_filter :format_params
  respond_to :json, only: [:create]

  def create
    @substance = 'alcohol'
    @unit = 'drink'
    super
    @series = AlcoholCalc.new(@args).series
    render json: @series
  end

  def save_consumption_record
      current_user.consumption_records.create(substance: @substance,
                                             amount: @args[:drinks],
                                             unit_of_measure: @unit)
  end

  def format_params
    @args = params[:alcohol_calc]
    @args[:save] = eval(params[:save_search]) if params[:save_search]
    @args[:weight] = @args[:weight].to_i
    @args[:alcohol] = @args[:drinks].to_i * 0.6
    @args[:hours] = @args[:hours].to_i
  end
end