#-----WIDMARK'S BAC % FORMULA-----
# Let
# alcohol = liquid ounces of alcohol
# weight = weight of person in pounds
# ratio = alcohol distribution ratio, 0.73 for men, 0.66 for women
# hours = period in hours since alcohol was consumed

# bac =  ((alcohol * 5.14) / (weight * ratio)) - (0.015 * hours)

class AlcoholCalc

  # Returns a series of BAC percentages at 15 minute intervals as a
  # nested array. The argument hash should have the following:
  # {
  #   starting_bac: defaults to 0,
  #   alcohol: ounces of pure alcohol,
  #   weight: in pounds,
  #   gender: "m" or "f",
  #   interval_count: defaults to 49 (12 hours)
  # }
  def self.bac_series(args)
    current_bac = args[:current_bac] || 0
    alcohol = args[:alcohol]
    weight = args[:weight]
    ratio = self.ratio(args[:gender])
    interval_count = args[:interval_count] || 49
    bac_series = []

    starting_bac = self.starting_bac(current_bac, alcohol, weight, ratio)

    interval_count.times do |interval|
      hours = interval * 0.25
      next_bac = self.next_bac(starting_bac, hours)
      bac_series << [hours, next_bac]
    end

    bac_series
  end

  private

  def self.starting_bac(current_bac, alcohol, weight, ratio)
    current_bac + ((alcohol * 5.14) / (weight * ratio)).round(4)
  end

  def self.next_bac(starting_bac, hours)
    next_bac = (starting_bac - (0.015 * hours)).round(4)
    next_bac < 0 ? 0 : next_bac
  end

  def self.ratio(gender)
    return 0.73 if gender == "m"
    return 0.66 if gender == "f"
  end
end