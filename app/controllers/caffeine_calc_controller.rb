class CaffeineCalcController < CalcController

  def create
    @substance = "caffeine"
    super
    @series = CaffeineCalc.new(@args).series
    render json: @series
  end

  def format_params
    @args = params[:caffeine_calc]
    @args[:save] = eval(params[:save_search]) if params[:save_search]
    @args[:hours] = @args[:hours].to_i
    @args[:milligrams] = MgOfCaffeine.caffeine_content(@args[:type], @args[:cups].to_i)
  end
end
