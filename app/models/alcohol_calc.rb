#-----NOTE!-----

# AlcoholCalc overrides some of SubstanceCalc's methods because Widmark's
# BAC % formula is very different from the formula used in SubstanceCalc.

#-----WIDMARK'S BAC % FORMULA-----
# Let
# alcohol = liquid ounces of alcohol
# weight = weight of person in pounds
# ratio = alcohol distribution ratio, 0.73 for men, 0.66 for women
# hours = period in hours since alcohol was consumed

# BAC % =  ((alcohol * 5.14) / (weight * ratio)) - (0.015 * hours)

class AlcoholCalc < SubstanceCalc

  def initialize(args)
    @current_dose = args[:current_bac] || 0
    @dose = args[:alcohol]
    @weight = args[:weight]
    @ratio = ratio(args[:gender])
    @hours = args[:hours]
    @interval_count = args[:interval_count] || 49
    @precision = 4
  end

  private

  # Returns BAC at a given moment (does factor in consumption time)
  def bac(dose, weight, ratio)
    ((dose * 5.14) / (weight * ratio))
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

  def next_dose_up(next_dose)
    next_dose = ((next_dose + bac(consumption_rate, @weight, @ratio)) - metabolized).round(@precision)
    next_dose < 0 ? 0 : next_dose
  end

  def next_dose_down(starting_dose, hours)
    next_dose = (starting_dose - (0.015 * hours)).round(@precision)
    next_dose < 0 ? 0 : next_dose
  end
end