#-----METABOLIZATION OF CAFFEINE-----

# There is no agreed formula for estimating the mg of caffeine present in the bloodstream.
# However, the elimination half-life has been estimated. One study reported an average of
# 4.9 hours among healthy adults, another study reported 6 hours. We will take the mean of
# these two studies and assume an average elimination half-life of 5.5 hours.

#Let
# milligrams = milligrams of caffeine consumed
# hours = hours passed since consumption
# Assume an hourly elimination rate of 9 %

# current dose = milligrams – (milligrams * (0.09 * hours))

# Relevant study:
# http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2995791/

class CaffeineCalc

  class << self
    def mg_series

    end

    # Returns a mg series during the time you are not drinking
    def mg_break_down(args)
      starting_mg = args[:starting_mg] || 0
      starting_hour = args[:starting_hour] || 0
      interval_count = args[:interval_count] || 49
      mg_series = []

      interval_count.times do |interval|
        hours = interval * 0.25
        next_mg = next_mg(starting_mg, hours)
        mg_series << [starting_hour + hours, next_mg]
      end

      mg_series
    end

    # Returns a mg series during the time you are continually drinking
    def mg_build_up

    end

    def next_mg(starting_mg, hours)
      next_mg = (starting_mg - (starting_mg * (0.09 * hours))).round(1)
      next_mg < 0 ? 0 : next_mg
    end
  end
end