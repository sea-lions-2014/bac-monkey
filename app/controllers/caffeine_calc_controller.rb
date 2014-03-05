class CaffeineCalcController < CalcController

  def create
    @substance = "caffeine"
    super
    @series = CaffeineCalc.new(@args).series
    render json: @series
  end

  def format_params
    @args = params[:caffeine_calc]
    super
    @args[:milligrams] = MgOfCaffeine.caffeine_content(@args[:type], @args[:cups].to_i)
  end
end
