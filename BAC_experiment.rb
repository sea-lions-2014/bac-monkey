#-----WIDMARK'S FORMULA-----
# Let
# A = liquid ounces of alcohol
# W = weight of person in pounds
# r = alcohol distribution ratio, 0.73 for men, 0.66 for women
# H = period in hours since alcohol was consumed

# %BAC =  ((a * 5.14) / (W * r)) – (0.015 * H)

#-----BAC CHANGE OVER TIME-----
# A man weighing 160 pounds consumes 3 shots (1.5 oz) of 80 proof alcohol. How does his BAC change over the course of 1 hour at 15 minute intervals ?

alcohol = 1.8
weight = 160
ratio = 0.73
hours = 0

4.times do |i|
  bac = ((alcohol * 5.14) / (weight * ratio)) - (0.015 * hours)
  puts "BAC at #{i * 15} minutes: #{bac.round(3)} %"
  hours += 0.25
end