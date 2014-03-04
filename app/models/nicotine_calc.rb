#-----METABOLIZATION OF NICOTINE-----

# Nicotine has an estimated elimination half-life of 2 hours among healthy
# adults.

#Let
# milligrams = milligrams of caffeine consumed
# hours = hours passed since consumption
# Assume an hourly elimination rate of 25 %

# current dose = milligrams – (milligrams * (0.25 * hours))

# Relevant study:
# http://www.ncbi.nlm.nih.gov/pubmed/7077531

class NicotineCalc < SubstanceCalc
  def initialize(args)
    super
    @elimination_rate = 0.25
    @precision = 3
  end
end