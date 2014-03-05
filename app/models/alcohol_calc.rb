#-----WIDMARK'S BAC % FORMULA-----
# Let
# alcohol = liquid ounces of alcohol
# weight = weight of person in pounds
# ratio = alcohol distribution ratio, 0.73 for men, 0.66 for women
# hours = period in hours since alcohol was consumed

# BAC % =  ((alcohol * 5.14) / (weight * ratio)) - (0.015 * hours)

class AlcoholCalc < SubstanceCalc

  def initialize(args)
    super
    @current_dose = args[:current_bac] || 0
    @dose = args[:alcohol]
    @weight = args[:weight]
    @ratio = ratio(args[:gender])
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

  # AlcoholCalc overrides SubstanceCalc's formula methods because Widmark's
  # BAC % formula is very different from the formula used in SubstanceCalc.

  def next_dose_up_formula(starting_dose)
    (starting_dose + bac(consumption_rate, @weight, @ratio)) - metabolized
  end

  def next_dose_down_formula(starting_dose, hours)
    starting_dose - (0.015 * hours)
  end
end