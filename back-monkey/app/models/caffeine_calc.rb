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

class CaffeineCalc < SubstanceCalc
    @elimination_rate = 0.09
    @precision = 1
end