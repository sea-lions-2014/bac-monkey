class NicotineCalcController < CalcController
  
  def create
    @substance = "nicotine"
    super
    @series = NicotineCalc.new(@args).series
    render json: @series
  end

  def format_params
    @args = params[:nicotine_calc]
    @args[:milligrams] = @args[:cigarettes].to_i
    super
  end
end
