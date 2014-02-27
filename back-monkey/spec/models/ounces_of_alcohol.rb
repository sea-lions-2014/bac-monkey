# Converts common drinks into ounces of pure alcohol.
class OuncesOfAlcohol
  def self.wine(number_of_drinks)
    self.alcohol_content(number_of_drinks, 5.0, 0.12)
  end

  def self.beer(number_of_drinks)
    self.alcohol_content(number_of_drinks, 12.0, 0.05)
  end

  def self.liquor(number_of_drinks)
    self.alcohol_content(number_of_drinks, 5.0, 0.40)
  end

  def self.alcohol_content(number_of_drinks, drink_ounces, percentage)
    (number_of_drinks * drink_ounces * percentage).round(2)
  end
end