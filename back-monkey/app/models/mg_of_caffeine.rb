class MgOfCaffeine
  class << self

    def coffee(number_of_drinks, drink_ounces)
      caffeine_content(number_of_drinks, drink_ounces, 12)
    end

    def tea(number_of_drinks, drink_ounces)
      caffeine_content(number_of_drinks, drink_ounces, 3)
    end

    def red_bull(number_of_drinks, drink_ounces)
      caffeine_content(number_of_drinks, drink_ounces, 9)
    end

    def caffeine_content(number_of_drinks, drink_ounces, mg_caff_per_ounce)
      (number_of_drinks * drink_ounces * mg_caff_per_ounce).round(1)
    end

  end
end