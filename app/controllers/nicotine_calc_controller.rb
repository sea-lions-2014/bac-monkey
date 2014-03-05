class NicotineCalcController < CalcController
  
  def create
    @substance = "nicotine"
    super
    @series = NicotineCalc.new(@args).series
    render json: @series
  end

  def format_params
    @args = params[:nicotine_calc]
    @args[:save] = eval(params[:save_search]) if params[:save_search]
    @args[:hours] = @args[:hours].to_i
    @args[:milligrams] = @args[:cigarettes].to_i
  end
end
