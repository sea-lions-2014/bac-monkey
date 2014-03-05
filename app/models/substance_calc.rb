class SubstanceCalc
    #-----THESE SHOULD BE ASSIGNED IN SUBCLASS #initialize-----

    #---@elimination_rate---
    # Rate at which a substance is eliminated from the body per hour.
    # Should be a percentage (e.g. 0.12 for 12%).

    #---@precision---
    # Number of decimal points to preserve in the mg calculations.
    # Substances that are measured in smaller doses should use higher
    # precision.


    #------------------------------------------------

    # Given the amount of substance consumed over a period of time, series
    # returns a data-point series of mg concentrations at 15 minute intervals
    # as a nested array. The argument hash has the following:
    # {
    #   starting_mg: optional, defaults to 0
    #   milligrams: mgs of the substance,
    #   hours: time spent continually consuming the substance, in intervals of 0.25
    #   interval_count: optional, defaults to 49 (12 hours of data-points)
    # }

    def initialize(args)
      @current_dose = args[:current_mg] || 0
      @dose = args[:milligrams]
      @hours = args[:hours]
      @interval_count = args[:interval_count] || 49
    end

    def series
      build_up + break_down
    end

    private

    # Returns a mg series during the time you are continually consuming a substance
    def build_up
      next_dose = @current_dose
      series = [[0, next_dose]]

      build_up_interval_count.times do |interval|
        next_dose = next_dose_up(next_dose)
        series << [next_hour(interval), next_dose]
      end

      series
    end

    # Returns a mg series during the time you are not consuming a substance
    def break_down
      series = []

      @interval_count.times do |interval|
        next_dose = next_dose_down(peak_dose, hours_passed(interval))
        series << [last_consumption_hour + hours_passed(interval), next_dose]
      end

      series
    end

    # Returns mg metabolized in 15 minutes
    def metabolized(milligrams)
      (milligrams * (@elimination_rate * 0.25))
    end

    def next_dose_up(starting_dose)
      next_dose = next_dose_up_formula(starting_dose).round(@precision)
      next_dose < 0 ? 0 : next_dose
    end

    def next_dose_down(starting_dose, hours)
      next_dose = next_dose_down_formula(starting_dose, hours).round(@precision)
      next_dose < 0 ? 0 : next_dose
    end

    def next_dose_up_formula(starting_dose)
      (starting_dose + consumption_rate) - metabolized(starting_dose)
    end

    def next_dose_down_formula(starting_dose, hours)
      starting_dose - (starting_dose * (@elimination_rate * hours))
    end

    def peak_dose
      build_up.last.last
    end

    def next_hour(interval)
      hours_passed(interval) + 0.25
    end

    def hours_passed(interval)
      interval * 0.25
    end

    def last_consumption_hour
      build_up.last.first
    end

    def build_up_interval_count
      (@hours / 0.25).to_i
    end

    def consumption_rate
      @dose / build_up_interval_count.to_f
    end
end