class SubstanceCalc
    #-----THESE SHOULD BE ASSIGNED IN SUBCLASSES-----

    # Rate at which a substance is eliminated from the body per hour.
    # Should be a percentage (e.g. 0.12 for 12%).
    @elimination_rate

    # Number of decimal points to preserve in the mg calculations.
    # Substances that are measured in smaller doses should use higher
    # precision.
    @precision

    #------------------------------------------------

    # Given the amount of substance consumed over a period of time, mg_series
    # returns a data-point series of mg concentrations at 15 minute intervals
    # as a nested array. The argument hash has the following:
    # {
    #   starting_mg: optional, defaults to 0
    #   milligrams: mgs of the substance,
    #   hours: time spent continually consuming the substance, in intervals of 0.25
    #   interval_count: optional, defaults to 49 (12 hours of data-points)
    # }

    def initialize
      @current_mg = args[:current_mg] || 0
      @milligrams = args[:milligrams]
      @hours = args[:hours]
      @interval_count = args[:interval_count] || 49
    end

    def mg_series
      build_up = mg_build_up
      break_down = mg_break_down
      build_up.pop
      build_up + break_down
    end

    private

    # Returns a mg series during the time you are continually consuming a substance
    def mg_build_up
      temp_current_mg = @current_mg
      build_up_interval_count = (@hours / 0.25).to_i
      consumption_rate = @milligrams / build_up_interval_count.to_f
      mg_series = [[0, @current_mg]]

      build_up_interval_count.times do |interval|
        temp_current_mg = (temp_current_mg + consumption_rate) - metabolized(temp_current_mg)
        temp_current_mg = 0 if temp_current_mg < 0
        mg_series << [interval * 0.25 + 0.25, temp_current_mg.round(@precision)]
      end

      mg_series
    end

    # Returns a mg series during the time you are not consuming a substance
    def mg_break_down(args)
      starting_mg = args[:starting_mg] || 0
      starting_hour = args[:starting_hour] || 0
      mg_series = []

      @interval_count.times do |interval|
        hours = interval * 0.25
        next_mg = next_mg(starting_mg, hours)
        mg_series << [starting_hour + hours, next_mg]
      end

      mg_series
    end

    # Returns mg metabolized in 15 minutes
    def metabolized(starting_mg)
      (starting_mg * (@elimination_rate * 0.25))
    end

    # Given a starting mg, returns mg after n hours have passed
    def next_mg(starting_mg, hours)
      next_mg = (starting_mg - (starting_mg * (@elimination_rate * hours))).round(@precision)
      next_mg < 0 ? 0 : next_mg
    end

    def last_mg
      mg_build_up.last.last
    end

    def last_drinking_hour
      mg_build_up.last.first
    end
end