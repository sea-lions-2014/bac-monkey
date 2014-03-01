#-----NOTE!-----

# AlcoholCalc cannot inherit from SubstanceCalc because alcohol
# intoxication is measured as BAC % rather than milligrams. Widmark's
# BAC % formula is also very different from the formula used in
# SubstanceCalc.

#-----WIDMARK'S BAC % FORMULA-----
# Let
# alcohol = liquid ounces of alcohol
# weight = weight of person in pounds
# ratio = alcohol distribution ratio, 0.73 for men, 0.66 for women
# hours = period in hours since alcohol was consumed

# BAC % =  ((alcohol * 5.14) / (weight * ratio)) - (0.015 * hours)

class AlcoholCalc

  def initialize(args)
    @current_bac = args[:current_bac] || 0
    @alcohol = args[:alcohol]
    @weight = args[:weight]
    @ratio = ratio(args[:gender])
    @hours = args[:hours]
    @interval_count = args[:interval_count] || 49
  end

  # Given the amount of alcohol consumed over a period of time, returns a
  # data-point series of BAC percentages at 15 minute intervals as a
  # nested array.
  def bac_series
    build_up = bac_build_up
    break_down = bac_break_down
    build_up.pop
    build_up + break_down
  end

  private

  # Returns BAC series during the time you are continually drinking
  def bac_build_up
    next_bac = @current_bac
    bac_series = [[0, @current_bac]]

    build_up_interval_count.times do |interval|
      # next_bac = next_bac_up(next_bac)
      next_bac = (next_bac + bac(consumption_rate, @weight, @ratio)) - metabolized
      next_bac = 0 if next_bac < 0
      bac_series << [interval * 0.25 + 0.25, next_bac.round(4)]
    end

    bac_series
  end

  # Returns a BAC series during the time you are not drinking
  def bac_break_down
    bac_series = []

    @interval_count.times do |interval|
      hours = interval * 0.25
      next_bac = next_bac_down(peak_bac, hours)
      bac_series << [last_drinking_hour + hours, next_bac]
    end

    bac_series
  end

  # Returns BAC at a given moment (does factor in consumption time)
  def bac(alcohol, weight, ratio)
    ((alcohol * 5.14) / (weight * ratio))
  end

  # Returns BAC metabolized in 15 minutes
  def metabolized
    (0.015 * 0.25)
  end

  # Returns alcohol distribution ratio based on gender
  def ratio(gender)
    return 0.73 if gender == "m"
    return 0.66 if gender == "f"
  end

  # def next_bac_up(next_bac)
  #   (next_bac + bac(consumption_rate, @weight, @ratio)) - metabolized
  #   next_bac = 0 if next_bac < 0
  #   next_bac
  # end

  def next_bac_down(starting_bac, hours)
    next_bac = (starting_bac - (0.015 * hours)).round(4)
    next_bac < 0 ? 0 : next_bac
  end

  def peak_bac
    bac_build_up.last.last
  end

  def last_drinking_hour
    bac_build_up.last.first
  end

  def build_up_interval_count
    (@hours / 0.25).to_i
  end

  def consumption_rate
    @alcohol / build_up_interval_count.to_f
  end
end