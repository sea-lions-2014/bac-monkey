# Converts common drinks into ounces of pure alcohol.
class OuncesOfAlcohol
  class << self

    def wine(number_of_drinks)
      alcohol_content(number_of_drinks, 5.0, 0.12)
    end

    def beer(number_of_drinks)
      alcohol_content(number_of_drinks, 12.0, 0.05)
    end

    def liquor(number_of_drinks)
      alcohol_content(number_of_drinks, 1.5, 0.40)
    end

    def alcohol_content(number_of_drinks, drink_ounces, percentage)
      (number_of_drinks * drink_ounces * percentage).round(2)
    end

  end
end